def sign_in_and_play
  visit('/')
  fill_in('player_1_name', with: 'Pabllo')
  fill_in('player_2_name', with: 'Anitta')
  click_on('Submit')
end