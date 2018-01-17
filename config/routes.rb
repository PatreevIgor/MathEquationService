# frozen_string_literal: true

LINEAR_TYPE    = 'linear'
QUADRATIC_TYPE = 'quadratic'

Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    scope :equations, action: :solve do
      post '/solve', constraints: ->(request) { request.params[:type] == LINEAR_TYPE },
                     controller: :linear_equations
      post '/solve', constraints: ->(request) { request.params[:type] == QUADRATIC_TYPE },
                     controller: :quadratic_equations
    end
  end
end
