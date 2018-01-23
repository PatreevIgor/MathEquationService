# frozen_string_literal: true

require 'rails_helper'

describe LinearEquationParamsValidator do
  subject { described_class.new(params) }

  describe '#valid_params?' do
    context 'when params are valid' do
      let(:params) { { a: 1, b: 2 } }

      it 'returns true' do
        expect(subject.valid_params?).to be true
      end

      it 'does not fill errors' do
        subject.valid_params?

        expect(subject.errors.full_messages).to be_empty
      end
    end

    context 'when params has wrong type' do
      context 'when param A has wrong type' do
        let(:params)        { { a: 'some text', b: 2 } }
        let(:full_messages) { ['A is not a number', 'equation does not have solutions'] }

        it 'returns false' do
          expect(subject.valid_params?).to be false
        end

        it 'fills errors' do
          subject.valid_params?

          expect(subject.errors.full_messages).to eq(full_messages)
        end
      end

      context 'when param B has wrong type' do
        let(:params)        { { a: 1, b: 'some text' } }
        let(:full_messages) { ['B is not a number'] }

        it 'returns false' do
          expect(subject.valid_params?).to be false
        end

        it 'fills errors' do
          subject.valid_params?

          expect(subject.errors.full_messages).to eq(full_messages)
        end
      end
    end

    context 'when missing params' do
      context 'when missing param A' do
        let(:params)        { { b: 2 } }
        let(:full_messages) { ["A can't be blank", 'A is not a number', 'equation does not have solutions'] }

        it 'returns false' do
          expect(subject.valid_params?).to be false
        end

        it 'fills errors' do
          subject.valid_params?

          expect(subject.errors.full_messages).to eq(full_messages)
        end
      end

      context 'when missing param B' do
        let(:params)        { { a: 2 } }
        let(:full_messages) { ["B can't be blank", 'B is not a number'] }

        it 'returns false' do
          expect(subject.valid_params?).to be false
        end

        it 'fills errors' do
          subject.valid_params?

          expect(subject.errors.full_messages).to eq(full_messages)
        end
      end
    end

    context 'when param a is equal 0 and b is not' do
      let(:params)        { { a: 0, b: 1 } }
      let(:full_messages) { ['equation does not have solutions'] }

      it 'returns false' do
        expect(subject.valid_params?).to be false
      end

      it 'fills errors' do
        subject.valid_params?

        expect(subject.errors.full_messages).to eq(full_messages)
      end
    end

    context 'when param A and B is equal 0' do
      let(:params)        { { a: 0, b: 0 } }
      let(:full_messages) { ['equation has many solutions'] }

      it 'returns false' do
        expect(subject.valid_params?).to be false
      end

      it 'fills errors' do
        subject.valid_params?

        expect(subject.errors.full_messages).to eq(full_messages)
      end
    end
  end
end
