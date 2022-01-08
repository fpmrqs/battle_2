require 'player'

describe Player do
  subject(:pabllo) { Player.new('Pabllo') }
  subject(:anitta) { Player.new('Anitta')}
  it 'has a name' do
    expect(pabllo.name).to eq 'Pabllo'
  end

  it 'has health points' do
    expect(pabllo.hp).to eq described_class::DEFAULT_HP
  end

  it 'takes damage' do
    expect { pabllo.take_damage }.to change { pabllo.hp }.by(-10)
  end
end