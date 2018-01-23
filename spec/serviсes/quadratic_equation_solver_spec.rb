# frozen_string_literal: true

require 'rails_helper'

describe QuadraticEquationSolver do
  subject { described_class.new(params) }

  describe '#solve_equation' do
    context 'when equation has two solutions' do
      let(:params) { { a: 1, b: 2, c: -3 } }
      let(:result) { [1, -3] }

      it 'returns result' do
        expect(subject.solve_equation).to eq(result)
      end
    end

    context 'when equation has only one solution' do
      let(:params) { { a: 1, b: 2, c: 1 } }
      let(:result) { -1 }

      it 'returns result' do
        expect(subject.solve_equation).to eq(result)
      end
    end

    context 'when equation does not have equations' do
      let(:params) { { a: 1, b: 2, c: 5 } }
      let(:result) { nil }

      it 'returns nil' do
        expect(subject.solve_equation).to eq(result)
      end
    end
  end
end
