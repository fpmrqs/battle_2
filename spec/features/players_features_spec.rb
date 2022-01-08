feature 'Players' do 
  scenario 'Players can fill in their names and see it on screen' do
    visit('/')
    fill_in('player_1_name', with: 'Ramses')
    click_on('Submit')
    expect(page).to have_content('Ramses')
  end
end
