require_relative "game_state"

class RankStrategy

  attr_reader :rank

  def initialize(ranking:)
    @ranking = ranking
  end

  def call
    if ranking <= 1

    elsif ranking <= 5
      
    else

    end
  end
end