# frozen_string_literal: true

# The module contains codes for responses to requests.

module Constants
  RESULT_CODES = {
    success:          0,
    validation_error: 1,
    wrong_type:       2,
    infinity:         3,
    no_solutions:     4
  }.freeze
end
