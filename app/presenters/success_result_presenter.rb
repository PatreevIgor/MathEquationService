# frozen_string_literal: true

class SuccessResultPresenter
  attr_reader :result

  def initialize(result)
    @result = result
  end

  def present
    { result: result, code: result_code(result) }
  end

  private

  def result_code(result)
    return Constants::RESULT_CODES[:infinity]     if result == Float::INFINITY
    return Constants::RESULT_CODES[:no_solutions] if result.nil?

    Constants::RESULT_CODES[:success]
  end
end
