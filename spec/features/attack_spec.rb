feature 'Players Attack' do
  before { sign_in_and_play }

  scenario 'Player can attack and get confirmation' do
    click_on('Attack')
    expect(page).to have_content('Pabllo attacked Anitta')
  end 

  scenario 'Player loses HP when attacked' do
    click_on('Attack')
    expect(page).to have_content('Anitta: 90/100HP')
  end
end