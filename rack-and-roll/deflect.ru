require "rack/contrib/deflect"

use Rack::Deflect, log: $stdout, request_threshold: 1, interval: 5, block_duration: 10

run lambda { |env|
  headers = { "Content-Type" => "text/plain" }
  [200, headers, ["Keep calm and try again in 10 seconds\n"]]
}

# curl http://localhost:9292

# Keep calm and try again in 10 seconds

# within the next 5 secs

# curl --verbose http://localhost:9292
# ..
# < HTTP/1.1 403 Forbidden

# after 10 secs

# curl http://localhost:9292

# Keep calm and try again in 10 seconds
