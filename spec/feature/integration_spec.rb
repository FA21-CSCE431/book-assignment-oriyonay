# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'book_title', with: 'to kill a mockingbird'
    fill_in 'book_author', with: 'harper lee'
    fill_in 'book_price', with: '10.99'
    # fill_in 'book_published_date', with: DateTime.current.strftime("%Y-%m-%d")
    click_on 'add book'
    visit books_path
    expect(page).to have_content('to kill a mockingbird')
  end

  scenario 'valid inputs author' do
    visit new_book_path
    fill_in 'book_title', with: '1984'
    fill_in 'book_author', with: 'george orwell'
    fill_in 'book_price', with: '12.99'
    # fill_in 'book_published_date', with: DateTime.current.strftime("%Y-%m-%d")
    click_on 'add book'
    visit books_path
    expect(page).to have_content('1984')
  end

  scenario 'valid inputs price' do
    visit new_book_path
    fill_in 'book_title', with: 'the outsiders'
    fill_in 'book_author', with: 's. e. hinton'
    fill_in 'book_price', with: '10.99'
    # fill_in 'book_published_date', with: DateTime.current.strftime("%Y-%m-%d")
    click_on 'add book'
    visit books_path
    expect(page).to have_content('the outsiders')
  end
end
