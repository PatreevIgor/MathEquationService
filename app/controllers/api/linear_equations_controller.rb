# frozen_string_literal: true

module Api
  class LinearEquationsController < ApplicationController
    ERROR_MESSAGE = 'Invalid input date!'

    def solve
      if params_validator.valid_params?
        render json: { result: 1 }
      else
        render json: { validate_error: ERROR_MESSAGE }
      end
    end

    private

    def params_validator
      @params_validator ||= LinearEquationParamsValidator.new(linear_equation_params)
    end

    def linear_equation_params
      params.permit(:a, :b)
    end
  end
end
