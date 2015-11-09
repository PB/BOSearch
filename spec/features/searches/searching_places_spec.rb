require 'rails_helper'

feature 'Searching places' do
  scenario 'search for place by country', js: true do
    visit root_path

    fill_in 'Search', with: 'USA'
    # fill_in 'Title', with: 'Test title'
    # fill_in 'Content', with: 'Test content'
    click_button 'Search'
    wait_for_ajax

    expect(page).to have_content('USA trip')
  end

  scenario 'search for place by date', js: true do
    visit root_path

    fill_in 'Min', with: '10'
    find_field('From').tap { |f| puts f.value.inspect }.set(I18n.l('01.07.2016'.to_date, format: '%Y-%m-%d'))
    find_field('To').tap { |f| puts f.value.inspect }.set(I18n.l('31.07.2016'.to_date, format: '%Y-%m-%d'))
    click_button 'Search'
    wait_for_ajax

    expect(page).to have_content('Zakopane tour')
  end

  scenario 'search for place by city and date', js: true do
    visit root_path

    fill_in 'Search', with: 'Athens'
    fill_in 'Min', with: '10'
    find_field('From').tap { |f| puts f.value.inspect }.set(I18n.l('01.07.2016'.to_date, format: '%Y-%m-%d'))
    find_field('To').tap { |f| puts f.value.inspect }.set(I18n.l('31.07.2016'.to_date, format: '%Y-%m-%d'))
    click_button 'Search'
    wait_for_ajax

    expect(page).to have_content('Athens tour')
  end
end
