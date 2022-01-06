def sign_in_and_play
  visit('/')
  fill_in('player_1', with: 'Pabblo')
  fill_in('player_2', with: 'Anitta')
  click_on('Submit')
end