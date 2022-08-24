require "httparty"
require_relative "./card"

class RainMan
  include HTTParty
  base_uri "http://rainman.leanpoker.org"

  def initialize(cards)
    @cards = cards
  end

  def ranking
    JSON.parse self.class.get("/rank?cards=#{@cards.to_json}")
  end
end
