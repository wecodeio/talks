require "rack/contrib/locale"

use Rack::Locale

run lambda { |env|
  headers = { "Content-Type" => "text/plain" }
  body = "Current locale is: #{env["rack.locale"]}\n"

  [200, headers, [body]]
}

# curl http://localhost:9292 -H "Accept-Language: es, en"

# Current locale is: es
