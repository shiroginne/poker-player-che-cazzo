require_relative "game_state"

class BetStrategy

  attr_reader :game_state

  def initialize(game_state:)
    @game_state = game_state
  end

  def call
    our_hand = game_state.our_hand
    if our_hand.all?(&:high_value?) || our_hand.first.rank == our_hand.second.rank || our_hand.first.suit == our_hand.second.suit
      raise_bet
    elsif our_hand.any?(&:high_value?)
      check
    else
      fold
    end
  end

  private

  def fold
    0
  end

  def check
    game_state.current_buy_in - game_state.our_bet
  end

  def raise_bet
    game_state.current_buy_in - game_state.our_bet + 50
  end
end
