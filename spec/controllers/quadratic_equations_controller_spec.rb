# frozen_string_literal: true

require 'rails_helper'

describe Api::QuadraticEquationsController do
  describe '#solve' do
    before { allow_any_instance_of(described_class).to receive(:params_validator).and_return(params_validator) }

    context 'when params are valid' do
      let(:params_validator)          { double(:params_validator, valid_params?: true) }
      let(:quadratic_equation_solver) { double(:quadratic_equation_solver, solve_equation: result) }
      let(:params)                    { { a: 1, b: 2, c: -3 } }
      let(:result)                    { [1.0, -3.0] }

      before do
        allow_any_instance_of(described_class).to receive(:quadratic_equation_solver)
          .and_return(quadratic_equation_solver)
      end

      it 'responses without errors' do
        expect(params_validator).to          receive(:valid_params?)
        expect(quadratic_equation_solver).to receive(:solve_equation)

        post :solve, params: params

        expect(response.body).to eq({ result: result }.to_json)
        expect(response.code).to eq('200')
      end
    end

    context 'when params are not valid' do
      let(:params)           { { a: 1, b: 2, c: 5 } }
      let(:params_validator) { double(:params_validator, valid_params?: false, errors: errors_object) }
      let(:errors_object)    { double(:errors_object, full_messages: message_object) }
      let(:message_object)   { double(:message_object, to_sentence: 'some_message') }

      it 'responses with errors' do
        expect(params_validator).to receive(:valid_params?)

        post :solve, params: params

        expect(response.body).to eq({ errors: 'some_message' }.to_json)
        expect(response.code).to eq('200')
      end
    end
  end
end
