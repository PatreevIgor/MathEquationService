# frozen_string_literal: true

class LinearEquationParamsValidator
  include ActiveModel::Model

  attr_accessor :a, :b, :params

  validates :a, :b, presence: true
  validates :a, :b, numericality: true
  validate  :equation_has_many_solutions, :equation_has_no_solutions

  def initialize(params)
    @params = params
    @a = params[:a]
    @b = params[:b]
  end

  def valid_params?
    valid?
  end

  private

  def equation_has_many_solutions
    return unless params[:a].zero? && params[:b].zero?
    errors.add(:expiration_date, 'equation has many solutions')
  end

  def equation_has_no_solutions
    return unless params[:a].zero? && params[:b] != 0
    errors.add(:expiration_date, 'equation has no solutions')
  end
end
