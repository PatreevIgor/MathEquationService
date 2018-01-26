# frozen_string_literal: true

# The class generates the response message, which contains the error and response code.

class ErrorResponsePresenter
  attr_reader :errors_object

  def initialize(errors_object)
    @errors_object = errors_object
  end

  def present
    { errors: errors_object.full_messages.to_sentence, code: Constants::RESULT_CODES[:validation_error] }
  end
end
