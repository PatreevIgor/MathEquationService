# frozen_string_literal: true

# The class solves the quadratic equation.
# Quadratic Equations: a * x**2 + b * x + c = 0
# discriminant = (b**2) - (4 * a * c)
# if discriminant > 0, =>
#   x1 = (-b + Math.sqrt(discriminant)) / 2 * a
#   x2 = (-b - Math.sqrt(discriminant)) / 2 * a
# if discriminant = 0, =>
#   x = -b / 2 * a
# if discriminant < 0, => the equation does not have solutions

class QuadraticEquationSolver
  attr_reader :params, :a, :b, :c

  def initialize(params)
    @a = params[:a].to_f
    @b = params[:b].to_f
    @c = params[:c].to_f
  end

  def solve_equation
    return one_solution  if equation_has_one_solution?
    return two_solutions if equation_has_two_solutions?
    return nil           if equation_does_not_have_solutions?
  end

  private

  def one_solution
    -b / 2 * a
  end

  def equation_has_one_solution?
    discriminant.zero?
  end

  def two_solutions
    [] << x1 << x2
  end

  def x1
    (-1 * b + root_of_discriminant) / 2 * a
  end

  def x2
    (-1 * b - root_of_discriminant) / 2 * a
  end

  def root_of_discriminant
    Math.sqrt(discriminant)
  end

  def discriminant
    (b**2) - (4 * a * c)
  end

  def equation_has_two_solutions?
    discriminant.positive?
  end

  def equation_does_not_have_solutions?
    discriminant.negative?
  end
end
