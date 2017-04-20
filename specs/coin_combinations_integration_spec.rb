require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the coin_combinations path', {:type => :feature}) do
  it('processes the amount input and returns it in coins') do
    visit('/')
    fill_in('coins', :with => '5')
    click_button('Submit')
    expect(page).to have_content("1 nickel")
  end

  it('resets to the index page on click of button') do
    visit('/')
    fill_in('coins', :with => '5')
    click_button('Submit')
    expect(page).to have_content("1 nickel")
    click_button('Reset')
    expect(page).to have_content("Enter an amount in cents")
  end
end
