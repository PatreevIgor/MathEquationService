# frozen_string_literal: true

# Linear Equations: ax + b = 0
# if a == 0 && b == 0, => the equation has many solutions
# if a == 0 && b != 0, => the equation does not have solutions
# if a != 0, => the equation has 1 solution: x = -b\a

class LinearEquationSolver
  include ActiveModel::Model

  attr_reader :params, :a, :b

  def initialize(params)
    @a = params[:a]
    @b = params[:b]
  end

  def solve_equation
    return Float::INFINITY if many_solution?
    return nil             if without_solution?

    -1 * b.to_f / a.to_f
  end

  private

  def many_solution?
    a.to_f.zero? && b.to_f.zero?
  end

  def without_solution?
    a.to_f.zero? && b != 0
  end
end
