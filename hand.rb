class Hand
  CARDS = {
    'hight_card': 0,
    'pair': 1,
    'two_pairs': 2,
    'three': 3,
    'straight': 4,
    'flush': 5,
    'full_house': 6,
    'four': 7,
    'straight_flush': 8
  }

  def call(cards)
    result = CARDS.find do |method_name, rank|
      return rank if public_send(method_name, cards)
    end
  end

  def hight_card(cards)
    true
  end

  def pair(cards)
    false
  end

  def two_pairs(cards)
    false
  end

  def three(cards)
    false
  end

  def straight(cards)
    false
  end

  def flush(cards)
    false
  end

  def full_house(cards)
    false
  end

  def four(cards)
    false
  end

  def straight_flush(cards)
    false
  end
end
