require_relative "card"

class GameState
  private attr_reader :data

  def initialize(data)
    @data = data
  end

  def our_player
    our_player_index = data["in_action"]
    @our_player ||= all_players[our_player_index]
  end

  def our_hand
    @our_hand ||= our_player["hole_cards"].map do |card|
      Card.new(rank: card["rank"], suit: card["suit"])
    end
  end

  def our_bet
    @our_bet ||= our_player["bet"]
  end

  def current_buy_in
    @current_buy_in ||= data["current_buy_in"]
  end

  def minimum_raise
    @minimum_raise ||= data["minimum_raise"]
  end

  def maximum_raise
    @maximum_raise ||= our_player["stack"]
  end

  def all_players
    @all_players ||= data["players"]
  end

  def community_cards
    @community_cards ||= data["community_cards"].map do |card|
      Card.new(rank: card["rank"], suit: card["suit"])
    end
  end

  def all_cards
    our_hand + community_cards
  end
end
