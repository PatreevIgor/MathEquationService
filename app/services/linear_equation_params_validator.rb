# frozen_string_literal: true

class LinearEquationParamsValidator
  JSON_SСHEMA = {
    'type':       'object',
    'required':   %w[a b],
    'properties': {
      'a': { 'type': 'integer' },
      'b': { 'type': 'integer' }
    }
  }.freeze

  attr_reader :params

  def initialize(params)
    @params = params.to_h
  end

  def valid_params?
    JSON::Validator.validate(JSON_SСHEMA, params)
  end
end
