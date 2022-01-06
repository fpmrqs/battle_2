feature 'Players HP' do
  before { sign_in_and_play }
  scenario 'check player 2 has HP' do
    expect(page).to have_content("100/100 HP")
  end
end