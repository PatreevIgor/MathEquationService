# frozen_string_literal: true

class ErrorResponsePresenter
  def present(errors_object)
    { errors: errors_object.full_messages.to_sentence }
  end
end
