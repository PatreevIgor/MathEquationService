# frozen_string_literal: true

class LinearEquationParamsValidator
  include ActiveModel::Model

  attr_accessor :a, :b
  attr_reader   :params

  validates :a, :b, presence: true
  validates :a, :b, numericality: true
  validate  :equation_has_many_solutions, :equation_has_no_solutions

  def initialize(params)
    @a = params[:a]
    @b = params[:b]
  end

  def valid_params?
    valid?
  end

  private

  def equation_has_many_solutions
    return unless a.to_f.zero? && b.to_f.zero?

    errors.add(:error, 'equation has many solutions')
  end

  def equation_has_no_solutions
    return unless a.to_f.zero? && b.to_f != 0

    errors.add(:error, 'equation does not have solutions')
  end
end
