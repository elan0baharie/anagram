require('capybara/rspec')
require('./app')
Capybara.app Sinatra::Application
set(:show_exceptions, false)

describe() do
  it('will get the text to the index page') do
    visit('/')
    fill_in('user-word', :with => 'Hail')
    click_button('Click')
    expect(page).to have_content('Hail')
  end
end
