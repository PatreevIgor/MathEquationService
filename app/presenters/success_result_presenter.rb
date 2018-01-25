# frozen_string_literal: true

class SuccessResultPresenter
  def present(result)
    { result: result, code: selection_code(result) }
  end

  private

  def selection_code(result)
    return Constants::RESULT_CODES[:infinity]     if result == Float::INFINITY
    return Constants::RESULT_CODES[:no_solutions] if result.nil?

    Constants::RESULT_CODES[:success]
  end
end
