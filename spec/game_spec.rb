require 'game'

describe Game do

  let(:player_1) { double(:player) }
  let(:player_2) { double(:player) }

  describe '#attack' do
    it "attacks" do
      expect(player_2).to receive(:take_damage)
      subject.attack(player_2)
    end
  end
end