# frozen_string_literal: true

module Api
  class LinearEquationsController < ApplicationController
    def solve
      if params_validator.valid_params?
        result = linear_equation_solver.solve_equation

        render json: success_result_presenter.present(result)
      else
        render json: errors_response_presenter.present(params_validator.errors)
      end
    end

    private

    def params_validator
      @params_validator ||= LinearEquationParamsValidator.new(linear_equation_params)
    end

    def linear_equation_solver
      @linear_equation_solver ||= LinearEquationSolver.new(linear_equation_params)
    end

    def linear_equation_params
      params.permit(:a, :b)
    end

    def linear_equation_solver
      @linear_equation_solver ||= LinearEquationSolver.new(linear_equation_params)
    end

    def success_result_presenter
      @success_result_presenter ||= SuccessResultPresenter.new
    end

    def errors_response_presenter
      @errors_response_presenter ||= ErrorResponsePresenter.new
    end
  end
end