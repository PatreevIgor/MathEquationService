# frozen_string_literal: true

require 'rails_helper'

describe Api::LinearEquationsController do
  describe '#solve' do
    before { allow_any_instance_of(described_class).to receive(:params_validator).and_return(params_validator) }

    context 'when params are valid' do
      let(:params_validator) { double(:params_validator, valid_params?: true) }
      let(:succses_result)   { { result: 1 }.to_json }
      let(:valid_params)     { { a: 1, b: 2 } }

      it 'returns success result' do
        post :solve, params: valid_params

        expect(response.body).to eq(succses_result)
      end
    end

    context 'when params contain wrong type' do
      let(:params_validator) { double(:params_validator, valid_params?: false) }
      let(:failure_result)   { { validate_error: 'Invalid input date!' }.to_json }
      let(:invalid_params)   { { a: '1', b: 2 } }

      it 'returns failure result' do
        post :solve, params: invalid_params

        expect(response.body).to eq(failure_result)
      end
    end

    context 'when not full params' do
      let(:params_validator) { double(:params_validator, valid_params?: false) }
      let(:failure_result)   { { validate_error: 'Invalid input date!' }.to_json }
      let(:invalid_params)   { { a: 1 } }

      it 'returns failure result' do
        post :solve, params: invalid_params

        expect(response.body).to eq(failure_result)
      end
    end
  end
end
