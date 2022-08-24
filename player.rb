require_relative "game_state"
require_relative "bet_strategy"

class Player
  VERSION = "	^(#｀∀´)_Ψ Mess with the best - die like the rest"

  def bet_request(game_state)
    @game_state = GameState.new(game_state)
    BetStrategy.new(game_state: @game_state).call
  rescue =>
    0 # we fold
  end

  def showdown(game_state)
  end
end
