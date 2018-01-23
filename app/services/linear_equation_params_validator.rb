# frozen_string_literal: true

class LinearEquationParamsValidator < EquationParamsValidator
  attr_accessor :a, :b

  validates :a, :b, presence: true
  validates :a, :b, numericality: true
end
