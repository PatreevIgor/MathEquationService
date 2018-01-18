# frozen_string_literal: true

module Api
  class LinearEquationsController < ApplicationController
    def solve
      if params_validator.valid_params?
        render json: { result: 1 }
      else
        render json: { errors: params_validator.errors.full_messages.to_sentence }
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
