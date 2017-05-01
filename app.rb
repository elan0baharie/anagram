require('sinatra')
require('sinatra/reloader')
also_reload('.lib/**/*.rb')
require('./lib/anagram')

get('/') do
  erb(:index)
end

get('/ana_form')do
  @user = params.fetch('user-word')
  @test = params.fetch('test-word')
  @result = @user.main(@test)
  erb(:index)
end
