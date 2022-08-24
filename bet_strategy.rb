require_relative "game_state"
require_relative "rain_man"

class BetStrategy

  attr_reader :game_state

  def initialize(game_state:)
    @game_state = game_state
  end

  def call
    if game_state.community_cards.count == 0
      check_our_hand
    elsif contain_pairs?
      raise_bet
    else
      # ranking = RainMan.new(game_state.all_cards).ranking
      # puts "This is ranking ==> #{ranking}"
      check
    end
  end

  private

  def check_our_hand
    our_hand = game_state.our_hand
    if game_state.our_hand.map(&:rank).uniq.count == 1
      double_raise_bet
    elsif our_hand.all?(&:high_value?)
      raise_bet
    elsif our_hand.any?(&:high_value?) || game_state.our_hand.map(&:suit).uniq.count == 1
      check
    else
      fold
    end
  end

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

  def contain_pairs?
    our_hand = game_state.our_hand
    first_card = our_hand[0]
    second_card = our_hand[1]

    game_state.community_cards.any? { |c| c.rank == first_card.rank || c.rank == second_card.rank }
  end
end
