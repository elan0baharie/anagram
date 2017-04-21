require('sinatra')
require('sinatra/reloader')
also_reload('.lib/**/*.rb')
require('.lib/anagram')

get('/') do
  erb(:index)
end

get('')do
  @result = params.fetch('user-word')
  erb(:index)
end
