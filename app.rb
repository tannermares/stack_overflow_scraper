require 'rubygems'
require 'sinatra'
require 'mechanize'

get '/' do
	agent = WWW::Mechanize.new
  	agent.get('http://stackoverflow.com/questions/tagged/ruby')
  	@questions = agent.page.search('.question-hyperlink')
  	erb :index
end

__END__
@@ index
<html>
  <body>
	<% @questions.each do |question| %>
		<li><%= question %></li>
	<% end %>
  </body>
</html>