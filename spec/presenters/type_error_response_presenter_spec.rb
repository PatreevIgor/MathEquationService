# frozen_string_literal: true

require 'rails_helper'

describe TypeErrorResponsePresenter do
  subject { described_class.new }

  describe '#present_as_response' do
    let(:result) do
      [
        200,
        { 'Content-Type' => 'application/javascript' },
        [{ errors: described_class::TYPE_ERROR_MESSAGE, code: 2 }.to_json]
      ]
    end

    it 'returns error message' do
      expect(subject.present_as_response).to eq(result)
    end
  end
end
