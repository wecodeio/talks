use Rack::Deflater
use Rack::Static, urls: %w(/images), root: "assets"

run lambda { |env|
  headers = { "Location" => "/images/rubyconfar-2013.png" }
  [301, headers, []]
}

# curl http://localhost:9292/images/rubyconfar-2013.png


# curl --verbose http://localhost:9292/
# ..
# < HTTP/1.1 301 Moved Permanently
# < Location: http://localhost:9292/images/rubyconfar-2013.png
