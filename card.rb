class Card
  attr_reader :suit, :rank

  def initialize(suit:, rank:)
    @suit = suit
    @rank = rank
  end

  def high_value?
    ["J", "Q", "K", "A"].include?(rank)
  end

  def same_rank?(other_cards)
    return true if other_cards.blank?

    other_cards.all? { |c| c.rank == rank }
  end

  def same_suit(other_cards)
    return true if other_cards.blank?

    other_cards.all? { |c| c.suit == suit }
  end

  def to_h
    {suit:, rank:}
  end
end
