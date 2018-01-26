# frozen_string_literal: true

# Base class for classes LinearEquationParamsValidator and QuadraticEquationParamsValidator.
# Checks the parameters of the equations for compliance validation.

class EquationParamsValidator
  include ActiveModel::Model

  def valid_params?
    valid?
  end
end
