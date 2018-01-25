# frozen_string_literal: true

module Api
  class QuadraticEquationsController < ApplicationController
    def solve
      if params_validator.valid_params?
        @result = quadratic_equation_solver.solve_equation

        render json: success_result_presenter.present
      else
        render json: errors_response_presenter.present
      end
    end

    private

    attr_reader :result

    def params_validator
      @params_validator ||= QuadraticEquationParamsValidator.new(quadratic_equation_params)
    end

    def quadratic_equation_params
      params.permit(:a, :b, :c)
    end

    def quadratic_equation_solver
      @quadratic_equation_solver ||= QuadraticEquationSolver.new(quadratic_equation_params)
    end

    def success_result_presenter
      @success_result_presenter ||= SuccessResultPresenter.new(result)
    end

    def errors_response_presenter
      @errors_response_presenter ||= ErrorResponsePresenter.new(params_validator.errors)
    end
  end
end
