feature 'Properties on the index page' do
  scenario 'link to an existing property details page' do
    add_default_property_listings
    visit_more_details_page
  end

  scenario 'link to an invalid property details page' do
    visit('/listing-details/1')
    expect(page).to have_current_path '/'
  end
end

