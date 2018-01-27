# frozen_string_literal: true

# The class provides validation of the parameters of the quadratic equation.

class QuadraticEquationParamsValidator < EquationParamsValidator
  attr_accessor :a, :b, :c

  validates :a, :b, :c, presence: true
  validates :a, :b, :c, numericality: true
end
