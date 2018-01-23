# frozen_string_literal: true

module Api
  class QuadraticEquationsController < ApplicationController
    def solve
      if params_validator.valid_params?
        result = quadratic_equation_solver.solve_equation

        render json: { result: result }
      else
        render json: { errors: params_validator.errors.full_messages.to_sentence }
      end
    end

    private

    def params_validator
      @params_validator ||= QuadraticEquationParamsValidator.new(quadratic_equation_params)
    end

    def quadratic_equation_params
      params.permit(:a, :b, :c)
    end

    def quadratic_equation_solver
      @quadratic_equation_solver ||= QuadraticEquationSolver.new(quadratic_equation_params)
    end
  end
end
