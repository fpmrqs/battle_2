require 'game'

describe Game do

  let(:player_1) { double(:player) }
  let(:player_2) { double(:player) }
  subject { Game.new(player_1, player_2) }

  it 'has two players' do
    expect(subject.player_1).to eq player_1
  end


  describe '#attack' do
    it 'attacks' do
      expect(player_2).to receive(:take_damage)
      subject.attack(player_2)
    end
  end
end