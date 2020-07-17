require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => './kadai.html.erb',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/kadai', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('', WEBrick::HTTPServlet::ERBHandler, 'kadai.html.erb')
server.mount('/kadai_indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'kadai_indicate.rb')
server.mount('/kadai.cgi', WEBrick::HTTPServlet::CGIHandler, 'kadai.rb')
server.start
