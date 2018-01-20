# frozen_string_literal: true

require 'rails_helper'

describe LinearEquationSolver do
  subject { described_class.new(params) }

  describe '#solve_equation' do
    context 'when params are valid' do
      let(:params) { { a: 1, b: 2 } }
      let(:x)      { -1 * params[:b] / params[:a] }

      it 'returns x' do
        expect(subject.solve_equation).to eq(x)
      end
    end
  end
end
