# frozen_string_literal: true

# The class solves the linear equation.
# Linear Equations: ax + b = 0
# if a == 0 and b == 0, => the equation has many solutions
# if a == 0 and b != 0, => the equation does not have solutions
# if a != 0,            => the equation has 1 solution: x = -b\a

class LinearEquationSolver
  attr_reader :params, :a, :b

  def initialize(params)
    @a = params[:a].to_f
    @b = params[:b].to_f
  end

  def solve_equation
    return Float::INFINITY if many_solution?
    return nil             if without_solution?

    -1 * b / a
  end

  private

  def many_solution?
    a.zero? && b.zero?
  end

  def without_solution?
    a.zero? && b != 0
  end
end
