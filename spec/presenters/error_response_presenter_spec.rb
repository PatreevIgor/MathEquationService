# frozen_string_literal: true

require 'rails_helper'

describe ErrorResponsePresenter do
  subject { described_class.new(errors_object) }

  describe '#present' do
    let(:errors_object)  { double(:errors_object, full_messages: message_object) }
    let(:message_object) { double(:message_object, to_sentence: errors_message) }
    let(:errors_message) { 'some errors' }
    let(:result_hash)    { { errors: errors_message, code: 1 } }

    it 'returns result hash with errors' do
      expect(subject.present).to eq(result_hash)
    end
  end
end
