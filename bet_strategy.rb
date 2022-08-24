require_relative "game_state"
require_relative "rain_man"
require_relative "our_hand"

class BetStrategy

  attr_reader :game_state

  def initialize(game_state:)
    @game_state = game_state
  end

  def call
    if game_state.community_cards.count == 0
      check_our_hand
    else
      response = RainMan.new(game_state.all_cards).call
      cards_used = response["cards_used"]
      if game_state.our_hand.any? { |c| cards_used.include?(c.to_h) }
        rank = response["rank"]
        raise_bet(percentage: rank&.to_i)
      end
    end
  rescue =>
    fold
  end

  private

  def check_our_hand
    ranking = OurHand.new(cards: game_state.our_hand).ranking
    case ranking
    when 0
      fold
    else
      raise_bet(percentage: ranking)
    end
  end

  def fold
    0
  end

  def check
    game_state.current_buy_in - game_state.our_bet
  end

  def all_in
    check + game_state.maximum_raise
  end

  def raise_bet(percentage: nil)
    return check + game_state.minimum_raise if percentage.nil?

    check + (game_state.maximum_raise * percentage / 100)
  end
end
