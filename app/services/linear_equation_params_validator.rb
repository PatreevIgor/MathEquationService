# frozen_string_literal: true

class LinearEquationParamsValidator
  include ActiveModel::Model

  attr_accessor :a, :b

  validates :a, :b, presence: true
  validates :a, :b, numericality: true

  def valid_params?
    valid?
  end
end
