# frozen_string_literal: true

require 'rails_helper'

describe Api::LinearEquationsController do
  describe '#solve' do
    before do
      allow_any_instance_of(described_class).to receive(:params_validator).and_return(params_validator)
    end

    context 'when params are valid' do
      let(:params_validator)       { double(:params_validator, valid_params?: true) }
      let(:linear_equation_solver) { double(:linear_equation_solver, solve_equation: x) }
      let(:succses_result)         { { result: x }.to_json }
      let(:valid_params)           { { a: 1, b: 2 } }
      let(:x)                      { -1 * valid_params[:b].to_i / valid_params[:a].to_i }

      it 'returns success result' do
        post :solve, params: valid_params

        expect(response.body).to eq(succses_result)
      end
    end

    context 'when params are not valid' do
      let(:errors_object)    { double(:errors_object, valid_params?: false) }
      let(:messages_object)  { double(:messages_object, to_sentence: error_message) }
      let(:params_validator) { double(:params_validator, valid_params?: false) }

      before do
        allow(params_validator).to receive(:errors).and_return(errors_object)
        allow(errors_object).to    receive(:full_messages).and_return(messages_object)
      end

      context 'when params contain wrong type' do
        let(:failure_result)   { { errors: error_message }.to_json }
        let(:invalid_params)   { { a: 'some text', b: 2 } }
        let(:error_message)    { 'wrong type val' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end

      context 'when not full params' do
        let(:failure_result)   { { errors: error_message }.to_json }
        let(:invalid_params)   { { b: 1 } }
        let(:error_message)    { 'val can not be blank' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end

      context 'when equation has no solutions' do
        let(:failure_result)   { { errors: error_message }.to_json }
        let(:invalid_params)   { { a: 0, b: 1 } }
        let(:error_message)    { 'equation has no solutions' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end

      context 'when equation has many solutions' do
        let(:failure_result)   { { errors: error_message }.to_json }
        let(:invalid_params)   { { a: 0, b: 0 } }
        let(:error_message)    { 'equation has many solutions' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end
    end
  end
end
