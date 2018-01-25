# frozen_string_literal: true

require 'rails_helper'

describe SuccessResultPresenter do
  subject { described_class.new(params) }

  describe '#present' do
    let(:params) { 'some content' }
    let(:result) { { result: params, code: 0 } }

    it 'returns result' do
      expect(subject.present).to eq(result)
    end
  end
end
