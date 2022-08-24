require_relative "game_state"

class BetStrategy

  attr_reader :game_state

  def initialize(game_state:)
    @game_state = game_state
  end

  def call
    if game_state.our_hand.all?(&:high_value?)
      raise_bet
    elsif game_state.our_hand.any?(&:high_value?)
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
    game_state.current_buy_in - game_state.our_bet + 10
  end
end
