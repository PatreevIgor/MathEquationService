# frozen_string_literal: true

# Routes redirect requests for the two endpoints, depending on the type of the equation.
# Upon detection of an incorrect type equation or its absence sends a response with error message and error code.

LINEAR_TYPE    = 'linear'
QUADRATIC_TYPE = 'quadratic'

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope :equations, action: :solve do
      post '/solve', constraints: ->(request) { request.params[:type] == LINEAR_TYPE },
                     controller: :linear_equations
      post '/solve', constraints: ->(request) { request.params[:type] == QUADRATIC_TYPE },
                     controller: :quadratic_equations
      post '/solve', to: ->(_env) { TypeErrorResponsePresenter.new.present_as_response }
    end
  end
end
