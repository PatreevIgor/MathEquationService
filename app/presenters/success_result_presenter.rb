# frozen_string_literal: true

class SuccessResultPresenter
  def present(result)
    { result: result, code: friendly_result(selection_code(result)) }
  end

  private

  def selection_code(result)
    return Constants::RESULT_CODES[:infinity]     if result == Float::INFINITY
    return Constants::RESULT_CODES[:no_solutions] if result.nil?

    Constants::RESULT_CODES[:success]
  end

  def friendly_result(result)
    return 'Sorry, this equation does not have solutions' if result.nil?
    return 'Sorry, this equation has infinity solutions'  if result == Float::INFINITY

    result
  end
end
