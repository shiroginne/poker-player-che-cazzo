require "./rain_man"

describe RainMan do
  describe "#ranking" do
    let(:cards) do
      [
        Card.new(rank: "5", suit: "diamonds"),
        Card.new(rank: "6", suit: "diamonds")
      ]
    end

    subject { described_class.new(cards) }

    it "call the ranking API" do
      allow(described_class).to receive(:get).and_return("something")

      expect(described_class).to receive(:get).with("/rank", cards: [
        {rank: "5", suit: "diamonds"},
        {rank: "6", suit: "diamonds"}
      ])

      subject.ranking
    end
  end
end
