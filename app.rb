require 'rubygems'
require 'sinatra'
require 'mechanize'

get '/' do
	agent = Mechanize.new
  	agent.get('http://stackoverflow.com/questions/tagged/ruby')
  	@rubyQuestions = agent.page.search('.question-hyperlink')
  	agent.get('http://stackoverflow.com/questions/tagged/git')
  	@questions = agent.page.search('.question-hyperlink')
  	erb :index
end