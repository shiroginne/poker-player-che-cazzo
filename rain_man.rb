require "httparty"
require_relative "./card"

class RainMan
  include HTTParty
  base_uri "http://rainman.leanpoker.org"

  def initialize(cards)
    @cards = cards
  end

  def call
    JSON.parse self.class.get("/rank?cards=#{@cards.map(&:to_h).map(&:to_json)}")
  rescue JSON::ParserError
    { "rank" => 0 }
  end
end
