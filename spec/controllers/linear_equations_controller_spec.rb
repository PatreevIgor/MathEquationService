# frozen_string_literal: true

require 'rails_helper'

describe Api::LinearEquationsController do
  describe '#solve' do
    before { allow_any_instance_of(described_class).to receive(:params_validator).and_return(params_validator) }

    context 'when params are valid' do
      let(:params_validator)       { double(:params_validator, valid_params?: true) }
      let(:linear_equation_solver) { double(:linear_equation_solver, solve_equation: result) }
      let(:success_result)         { { result: result }.to_json }
      let(:valid_params)           { { a: 1, b: 2 } }
      let(:result)                 { -2.0 }

      it 'returns success result' do
        post :solve, params: valid_params

        expect(response.body).to eq(success_result)
      end
    end

    context 'when params are not valid' do
      let(:errors_object)    { double(:errors_object, full_messages: messages_object) }
      let(:messages_object)  { double(:messages_object, to_sentence: error_message) }
      let(:params_validator) { double(:params_validator, valid_params?: false, errors: errors_object) }

      context 'when params contain wrong type' do
        let(:failure_result) { { errors: error_message }.to_json }
        let(:invalid_params) { { a: 'some text', b: 2 } }
        let(:error_message)  { 'wrong type of a' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end

      context 'when not full params' do
        let(:failure_result) { { errors: error_message }.to_json }
        let(:invalid_params) { { b: 1 } }
        let(:error_message)  { 'a can not be blank' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end

      context 'when equation has no solutions' do
        let(:failure_result) { { errors: error_message }.to_json }
        let(:invalid_params) { { a: 0, b: 1 } }
        let(:error_message)  { 'equation does not have solutions' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end

      context 'when equation has many solutions' do
        let(:failure_result) { { errors: error_message }.to_json }
        let(:invalid_params) { { a: 0, b: 0 } }
        let(:error_message)  { 'equation has many solutions' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end
    end
  end
end
