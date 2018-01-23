# frozen_string_literal: true

# Quadratic Equations: a * x ** 2 + b * x + c = 0
# discriminant = (b ** 2) - (4 * a * c)
# if discriminant > 0, => 
#   x1 = (-b + Math.sqrt(discriminant)) / 2 * a
#   x2 = (-b - Math.sqrt(discriminant)) / 2 * a
# if discriminant = 0, =>
#   x = -b / 2 * a
# if discriminant < 0, => the equation does not have solutions

class QuadraticEquationSolver
  include ActiveModel::Model

  attr_reader :params, :a, :b, :c

  def initialize(params)
    @a = params[:a].to_f
    @b = params[:b].to_f
    @c = params[:c].to_f
  end

  def solve_equation
    return solve_equation_with_two_solution if equation_have_two_solutions?
    return solve_equation_with_one_solution if equation_have_one_solution?
    return nil                              if equation_does_not_have_solutions?
  end

  private

  def solve_equation_with_two_solution
    x1 = (-1 * b + Math.sqrt(discriminant)) / 2 * a
    x2 = (-1 * b - Math.sqrt(discriminant)) / 2 * a

    [] << x1 << x2
  end

  def solve_equation_with_one_solution
    x = -b / 2 * a
  end

  def equation_have_two_solutions?
    discriminant > 0
  end

  def equation_have_one_solution?
    discriminant == 0
  end

  def equation_does_not_have_solutions?
    discriminant < 0
  end

  def discriminant
    (b ** 2) - (4 * a * c)
  end
end
