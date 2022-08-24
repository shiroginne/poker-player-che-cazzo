require "spec_helper"
require "./game_state"

describe GameState do
  let(:data) do
    {
      "tournament_id" => "550d1d68cd7bd10003000003",
      "game_id" => "550da1cb2d909006e90004b1",
      "round" => 0,
      "bet_index" => 0,
      "small_blind" => 10,
      "current_buy_in" => 320,
      "pot" => 400,
      "minimum_raise" => 240,
      "dealer" => 1,
      "orbits" => 7,
      "in_action" => 1,
      "players" => [
        {
          "id" => 0,
          "name" => "Albert",
          "status" => "active",
          "version" => "Default random player",
          "stack" => 1010,
          "bet" => 320
        },
        {
          "id" => 1,
          "name" => "Bob",
          "status" => "active",
          "version" => "Default random player",
          "stack" => 1590,
          "bet" => 80,
          "hole_cards" => [
            {
              "rank" => "6",
              "suit" => "hearts"
            },
            {
              "rank" => "K",
              "suit" => "spades"
            }
          ]
        },
        {
          "id" => 2,
          "name" => "Chuck",
          "status" => "out",
          "version" => "Default random player",
          "stack" => 0,
          "bet" => 0
        }
      ],
      "community_cards" => [
        {
          "rank" => "4",
          "suit" => "spades"
        },
        {
          "rank" => "A",
          "suit" => "hearts"
        },
        {
          "rank" => "6",
          "suit" => "clubs"
        }
      ]
    }
  end

  subject { GameState.new(data) }

  describe "#all_players" do
    it do
      expect(subject.all_players).to match(data["players"])
    end
  end

  describe "#our_player" do
    it do
      expect(subject.our_player).to match(data["players"][1])
    end
  end

  describe "#community_cards" do
    it do
      expect(subject.community_cards).to match([
        have_attributes(
          "rank" => "4",
          "suit" => "spades"
        ),
        have_attributes(
          "rank" => "A",
          "suit" => "hearts"
        ),
        have_attributes(
          "rank" => "6",
          "suit" => "clubs"
        )
      ])
    end
  end

  describe "#our_hand" do
    it "returns hand" do
      expect(subject.our_hand).to match([
        have_attributes(
          "rank" => "6",
          "suit" => "hearts"
        ),
        have_attributes(
          "rank" => "K",
          "suit" => "spades"
        )
      ])
    end
  end
end
