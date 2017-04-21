require('capybara/rspec')
require('./app.rb')
Capybara.app = Sinatra::Application
set(:show_execptions, false)

describe('path for answer', {:type => :feature}) do
  it('will get the text to the index page') do
    visit('/')
    fill_in('user-word', :with => 'Hail')
    click_button('Click')
    expect(page).to have_content('Hail')
  end
end
