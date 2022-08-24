require './hand'
require 'spec_helper'

RSpec.describe Hand do
  subject { described_class.new }

  describe 'call' do
    context 'hight_card' do
      let(:cards) do
        [
          {
              "rank": "5",
              "suit": "diamonds"
          },
          {
              "rank": "6",
              "suit": "diamonds"
          },
          {
              "rank": "7",
              "suit": "diamonds"
          },
          {
              "rank": "10",
              "suit": "spades"
          },
          {
              "rank": "8",
              "suit": "diamonds"
          },
          {
              "rank": "9",
              "suit": "diamonds"
          }
        ]
      end

      it 'returns hand' do
        expect(subject.call(cards)).to eq(0)
      end
    end
  end
end
