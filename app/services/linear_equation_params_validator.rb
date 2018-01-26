# frozen_string_literal: true

# The class provides validation of the parameters of the linear equation.

class LinearEquationParamsValidator < EquationParamsValidator
  attr_accessor :a, :b

  validates :a, :b, presence: true
  validates :a, :b, numericality: true
end
