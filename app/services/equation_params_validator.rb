# frozen_string_literal: true

class EquationParamsValidator
  include ActiveModel::Model

  def valid_params?
    valid?
  end
end
