require_relative "game_state"

class Player
  VERSION = "～(^з^)-☆"

  def bet_request(game_state)
    @game_state = GameState.new(game_state)
    BetStrategy.new(game_state: @game_state)
  end

  def showdown(game_state)
  end
end
