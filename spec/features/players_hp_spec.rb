feature 'Players HP' do
  before { sign_in_and_play }
  scenario 'check player 2 has HP' do
    expect(page).to have_content("Anitta: 100/100HP")
    expect(page).to have_content("Pabllo: 100/100HP")
  end
end