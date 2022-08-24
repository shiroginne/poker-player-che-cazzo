require "httparty"
require_relative "./card"

class RainMan
  include HTTParty
  base_uri "http://rainman.leanpoker.org"

  def initialize(cards)
    @options = {cards: cards.map(&:to_h)}
  end

  def ranking
    self.class.get("/rank", @options)
  end
end
