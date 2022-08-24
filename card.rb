class Card
  attr_reader :suit, :rank

  def initialize(suit:, rank:)
    @suit = suit
    @rank = rank
  end

  def high_value?
    ["J", "Q", "K", "A"].include?(rank)
  end
end
