# frozen_string_literal: true

class ErrorResponsePresenter
  def present(errors_object)
    { errors: errors_object.full_messages.to_sentence, code: Constants::RESULT_CODES[:validation_error] }
  end
end
