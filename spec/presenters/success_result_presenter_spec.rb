# frozen_string_literal: true

require 'rails_helper'

describe SuccessResultPresenter do
  subject { described_class.new(result) }

  describe '#present' do
    context 'when result equal infiniti' do
      let(:result)          { Float::INFINITY }
      let(:friendly_result) { { result: 'Sorry, this equation has infinity solutions', code: 3 } }

      it 'returns friendly result' do
        expect(subject.present).to eq(friendly_result)
      end
    end

    context 'when result equal nil' do
      let(:result)          { nil }
      let(:friendly_result) { { result: 'Sorry, this equation does not have solutions', code: 4 } }

      it 'returns friendly result' do
        expect(subject.present).to eq(friendly_result)
      end
    end

    context 'when result equal some solution' do
      let(:result)          { 'some solution' }
      let(:friendly_result) { { result: 'some solution', code: 0 } }

      it 'returns friendly result' do
        expect(subject.present).to eq(friendly_result)
      end
    end
  end
end
