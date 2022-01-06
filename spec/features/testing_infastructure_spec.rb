feature 'features' do
  scenario 'checks the homepage works' do
    visit('/') 
    expect(page).to have_content 'Player 1'
  end
end
