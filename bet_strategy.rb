require_relative "game_state"

class BetStrategy

  attr_reader :game_state

  def initialize(game_state:)
    @game_state = game_state
  end

  def call
    our_hand = game_state.our_hand
    community = game_state.community_cards
    if our_hand.all?(&:high_value?) || game_state.all_cards.map(&:rank).uniq.count == 1 || game_state.all_cards.map(&:suit).uniq.count == 1
      double_raise_bet
    elsif our_hand.all?(&:high_value?) || community.any?(:high_value?)
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
    check + game_state.minimum_raise
  end

  def double_raise_bet
    raise_bet * 2
  end
end
