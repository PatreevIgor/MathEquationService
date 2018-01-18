# frozen_string_literal: true

require 'rails_helper'

describe Api::LinearEquationsController do
  describe '#solve' do
    before do
      allow_any_instance_of(described_class).to receive(:params_validator).and_return(params_validator)
    end

    context 'when params are valid' do
      let(:params_validator) { double(:params_validator, valid_params?: true) }
      let(:succses_result)   { { result: 1 }.to_json }
      let(:valid_params)     { { a: 1, b: 2 } }

      it 'returns success result' do
        post :solve, params: valid_params

        expect(response.body).to eq(succses_result)
      end
    end

    context 'when params are not valid' do
      let(:errors_object)   { double(:errors_object, valid_params?: false) }
      let(:messages_object) { double(:messages_object, to_sentence: error_message) }

      before do
        allow(params_validator).to receive(:errors).and_return(errors_object)
        allow(errors_object).to    receive(:full_messages).and_return(messages_object)
      end

      context 'when params contain wrong type' do
        let(:params_validator) { double(:params_validator, valid_params?: false) }
        let(:failure_result)   { { errors: error_message }.to_json }
        let(:invalid_params)   { { a: 'some text', b: 2 } }
        let(:error_message)    { 'some_string' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end

      context 'when not full params' do
        let(:params_validator) { double(:params_validator, valid_params?: false) }
        let(:failure_result)   { { errors: error_message }.to_json }
        let(:invalid_params)   { { b: 1 } }
        let(:error_message)    { 'some_string2' }

        it 'returns failure result' do
          post :solve, params: invalid_params

          expect(response.body).to eq(failure_result)
        end
      end
    end
  end
end
