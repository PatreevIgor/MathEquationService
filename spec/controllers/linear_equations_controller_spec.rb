# frozen_string_literal: true

require 'rails_helper'

describe Api::LinearEquationsController do
  describe '#solve' do
    before { allow_any_instance_of(described_class).to receive(:params_validator).and_return(params_validator) }

    context 'when params are valid' do
      let(:params)                 { { a: 1, b: 2 } }
      let(:params_validator)       { double(:params_validator, valid_params?: true) }
      let(:linear_equation_solver) { double(:linear_equation_solver, solve_equation: result) }
      let(:result)                 { -2.0 }

      before do
        allow_any_instance_of(described_class).to receive(:linear_equation_solver).and_return(linear_equation_solver)
      end

      it 'responses without errors' do
        expect(params_validator).to       receive(:valid_params?)
        expect(linear_equation_solver).to receive(:solve_equation)

        post :solve, params: params

        expect(response.body).to eq({ result: result, code: 0 }.to_json)
        expect(response.code).to eq('200')
      end
    end

    context 'when params are not valid' do
      let(:params)           { { a: 1, b: 2 } }
      let(:params_validator) { double(:params_validator, valid_params?: false, errors: errors_object) }
      let(:errors_object)    { double(:errors_object, full_messages: message_object) }
      let(:message_object)   { double(:message_object, to_sentence: message) }
      let(:message)          { 'some_message' }

      it 'responses with errors' do
        expect(params_validator).to receive(:valid_params?).and_return(false)

        post :solve, params: params

        expect(response.body).to eq({ errors: message, code: 1 }.to_json)
        expect(response.code).to eq('200')
      end
    end
  end
end
