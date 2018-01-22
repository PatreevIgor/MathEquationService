# frozen_string_literal: true

class LinearEquationParamsValidator
  include ActiveModel::Model

  attr_accessor :a, :b

  validates :a, :b, presence: true
  validates :a, :b, numericality: true
  validate  :equation_has_many_solutions, :equation_has_no_solutions

  def valid_params?
    valid?
  end

  private

  def equation_has_many_solutions
    return unless a.to_f.zero? && b.to_f.zero?

    errors.add(:base, 'equation has many solutions')
  end

  def equation_has_no_solutions
    return unless a.to_f.zero? && b.to_f != 0

    errors.add(:base, 'equation does not have solutions')
  end
end
