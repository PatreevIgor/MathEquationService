# frozen_string_literal: true

# The class generates the response message, which contains friendly result and response code.
# Friendly result is converted from the result.

class SuccessResultPresenter
  INFINITY_SOLUTIONS_MESSAGE = 'Sorry, this equation has infinity solutions'
  MISSING_SOLUTIONS_MESSAGE  = 'Sorry, this equation does not have solutions'

  attr_reader :resul

  def initialize(result)
    @result = result
  end

  def present
    { result: friendly_result(result), code: result_code(result) }
  end

  private

  def result_code(result)
    return Constants::RESULT_CODES[:infinity]     if result == Float::INFINITY
    return Constants::RESULT_CODES[:no_solutions] if result.nil?

    Constants::RESULT_CODES[:success]
  end

  def friendly_result(result)
    return INFINITY_SOLUTIONS_MESSAGE if result == Float::INFINITY
    return MISSING_SOLUTIONS_MESSAGE  if result.nil?

    result
  end
end
