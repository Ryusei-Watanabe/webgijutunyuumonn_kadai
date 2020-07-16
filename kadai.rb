require 'cgi'
cgi = CGI.new
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['kadai']
  "<html>
    <body>
      <p>このデパートの従業員情報になります</p>
      文字列：#{get}
    </body>
  </html>"
}
