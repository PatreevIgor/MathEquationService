# frozen_string_literal: true

require 'rails_helper'

describe LinearEquationSolver do
  subject { described_class.new(params) }

  describe '#solve_equation' do
    context 'when equation has only one solution' do
      let(:params) { { a: 1, b: 2 } }
      let(:result) { -2 }

      it 'returns result' do
        expect(subject.solve_equation).to eq(result)
      end
    end

    context 'when equation does not have solutions' do
      let(:params) { { a: 0, b: 1 } }
      let(:result) { nil }

      it 'returns nil' do
        expect(subject.solve_equation).to eq(result)
      end
    end

    context 'when equation has many solutions' do
      let(:params) { { a: 0, b: 0 } }
      let(:result) { Float::INFINITY }

      it 'returns infinite number' do
        expect(subject.solve_equation).to eq(result)
      end
    end
  end
end
