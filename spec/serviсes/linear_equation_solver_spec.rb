# frozen_string_literal: true

require 'rails_helper'

describe LinearEquationSolver do
  subject { described_class.new(params) }

  describe '#solve_equation' do
    context 'when params are valid' do
      let(:params) { { a: 1, b: 2 } }
      let(:result) { -2 }

      it 'returns result' do
        expect(subject.solve_equation).to eq(result)
      end
    end

    context 'when params are not valid' do
      context 'when param a is equal 0 and b is not' do
        let(:params) { { a: 0, b: 1 } }
        let(:result) { nil }

        it 'returns nil' do
          expect(subject.solve_equation).to eq(result)
        end
      end

      context 'when param a and b is equal 0' do
        let(:params) { { a: 0, b: 0 } }
        let(:result) { Float::INFINITY }

        it 'returns infinite number' do
          expect(subject.solve_equation).to eq(result)
        end
      end
    end
  end
end
