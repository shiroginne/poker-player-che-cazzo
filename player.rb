class Player
  VERSION = "～(^з^)-☆"

  def bet_request(game_state)
    @game_state = GameState.new(game_state)
    [0,10].sample
  end

  def showdown(game_state)
  end
end
