class GameState
  private att_reader :our_player

  def initialize(players)
    @data = data
  end

  def setup
  end

  def get_our_player
    our_player_index = data["in_action"]
    @our_player = all_players[our_player_index]
  end

  def our_hand
    our_player["hole_cards"]
  end

  def all_players
    data["players"]
  end
end
