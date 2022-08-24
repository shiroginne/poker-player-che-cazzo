class OurHand
  attr_reader :first_card, :second_card, :cards

  def initialize(cards:)
    @cards = cards
    @first_card = cards[0]
    @second_card = cards[1]
  end

  def ranking
    if is_a_pair?
      30
    elsif all_high?
      20
    elsif one_high? || same_suit?
      10
    else
      0
    end
  end

  def is_a_pair?
    first_card.rank == second_card.rank
  end

  def all_high?
    cards.all?(&:high_value?)
  end

  def one_high?
    cards.any?(&:high_value?)
  end

  def same_suit?
    first_card.suit == second_card.suit
  end
end