# frozen_string_literal: true

require 'rails_helper'

describe QuadraticEquationSolver do
  subject { described_class.new(params) }

  describe '#solve_equation' do
    context 'when params are valid' do
      context 'when params a,b,c = 1,2,-3' do
        let(:params) { { a: 1, b: 2, c: -3 } }
        let(:result) { [1, -3] }

        it 'returns result' do
          expect(subject.solve_equation).to eq(result)
        end
      end

      context 'when params a,b,c = 1,2,1' do
        let(:params) { { a: 1, b: 2, c: 1 } }
        let(:result) { -1 }

        it 'returns result' do
          expect(subject.solve_equation).to eq(result)
        end
      end
    end

    context 'when params are not valid' do
      context 'when params a,b,c = 1,2,5' do
        let(:params) { { a: 1, b: 2, c: 5 } }
        let(:result) { nil }

        it 'returns nil' do
          expect(subject.solve_equation).to eq(result)
        end
      end
    end
  end
end
