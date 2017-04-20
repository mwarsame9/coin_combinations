require('sinatra')
require('sinatra/reloader')
require('./lib/coin_combinations')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/coins') do
  combination = CoinCombinations.new
  @coins = combination.print_to_screen(params.fetch('coins'))
  erb(:output)
end
