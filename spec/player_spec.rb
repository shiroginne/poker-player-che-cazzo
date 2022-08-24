require './player'
require 'spec_helper'

RSpec.describe Player do
  let(:player) { described_class.new }

  it 'returns bet_request' do
    expect(player).to respond_to(:bet_request)
  end
end
