# frozen_string_literal: true

class TypeErrorResponsePresenter
  TYPE_ERROR_MESSAGE = 'This type of equation is not supported'

  def present_as_response
    [response_code, response_type, response_message]
  end

  private

  def response_code
    200
  end

  def response_type
    { 'Content-Type' => 'application/javascript' }
  end

  def response_message
    [{ errors: TYPE_ERROR_MESSAGE, code: Constants::RESULT_CODES[:wrong_type] }.to_json]
  end
end
