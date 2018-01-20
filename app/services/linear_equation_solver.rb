# frozen_string_literal: true

class LinearEquationSolver
  include ActiveModel::Model

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def solve_equation
    -1 * params[:b].to_i / params[:a].to_i
  end
end
