require 'rubygems'
require 'sinatra'
require 'mechanize'

get '/' do
	agent = Mechanize.new
  	agent.get('http://stackoverflow.com/questions/tagged/ruby')
  	@questions = agent.page.search('.question-hyperlink')
  	erb :index
end