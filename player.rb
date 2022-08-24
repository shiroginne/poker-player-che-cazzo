require_relative "game_state"
require_relative "bet_strategy"

class Player
  VERSION = "	^(#｀∀´)_Ψ We are coming for you SunflowerLXIX"

  def bet_request(game_state)
    @game_state = GameState.new(game_state)
    BetStrategy.new(game_state: @game_state).call
  end

  def showdown(game_state)
  end
end
