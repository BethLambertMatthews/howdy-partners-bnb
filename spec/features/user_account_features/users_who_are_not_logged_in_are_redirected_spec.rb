feature 'guest users cannot access certain pages' do
  scenario 'when going to /my-properties' do
    visit('/my-properties')
    expect(page).to have_current_path '/'
  end

  scenario 'when going to /add-new-property' do
    visit('/add-new-property')
    expect(page).to have_current_path '/'
  end
  
end