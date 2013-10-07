require "rack/contrib/static_cache"

use Rack::StaticCache, urls: %w(/images), root: "assets", versioning: false

run lambda { |env|
  headers = { "Location" => "/images/rubyconfar-2013.png" }
  [301, headers, []]
}

# curl --verbose http://localhost:9292/images/rubyconfar-2013.png | head

# ..
# < Content-Type: image/png
# < Content-Length: 38520
# < Cache-Control: max-age=31536000, public
# < Expires: Mon, 29 Sep 2014 11:28:20 GMT
