# frozen_string_literal: true

require 'rails_helper'

describe LinearEquationParamsValidator do
  subject { described_class.new(params) }

  describe '#valid_params?' do
    context 'when params are valid' do
      let(:params) { { 'type': 'linear', 'a': 1, 'b': 2 } }

      it 'returns true' do
        expect(subject.valid_params?).to be true
      end
    end

    context 'when params are not valid' do
      let(:params) { { 'type': 'linear', 'a': '1', 'b': 2 } }

      it 'returns false' do
        expect(subject.valid_params?).to be false
      end
    end
  end
end
