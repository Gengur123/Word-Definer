require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload 'lib/**/*.rb'
require 'pry'

get ('/') do
  @words = Word.all
  erb(:words)
end