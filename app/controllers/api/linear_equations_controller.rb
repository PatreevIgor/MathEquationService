# frozen_string_literal: true

module Api
  class LinearEquationsController < ApplicationController
    def solve
      if params_validator.valid_params?
        result = linear_equation_solver.solve_equation

        render json: { result: result }
      else
        render json: { errors: params_validator.errors.full_messages.to_sentence }
      end
    end

    private

    def linear_equation_solver
      @linear_equation_solver ||= LinearEquationSolver.new(linear_equation_params)
    end

    def params_validator
      @params_validator ||= LinearEquationParamsValidator.new(linear_equation_params)
    end

    def linear_equation_params
      params.permit(:a, :b)
    end
  end
end
