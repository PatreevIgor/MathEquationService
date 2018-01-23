# frozen_string_literal: true

class QuadraticEquationParamsValidator < EquationParamsValidator
  attr_accessor :a, :b, :c

  validates :a, :b, :c, presence: true
  validates :a, :b, :c, numericality: true
end
