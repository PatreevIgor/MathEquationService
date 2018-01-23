# frozen_string_literal: true

class QuadraticEquationParamsValidator
  include ActiveModel::Model

  attr_accessor :a, :b, :c

  validates :a, :b, :c, presence: true
  validates :a, :b, :c, numericality: true
  validate  :equation_does_not_have_solutions

  def valid_params?
    valid?
  end

  private

  def equation_does_not_have_solutions
    return unless discriminant < 0

    errors.add(:base, 'equation does not have solutions')
  end

  def discriminant
    (b ** 2) - (4 * a * c)
  end
end
