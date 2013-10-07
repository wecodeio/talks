use Rack::Logger, "log/rack.log"

run lambda { |env|
  headers = { "Content-Type" => "text/plain" }
  [200, headers, ["Done logging <3\n"]]
}

# curl http://localhost:9292/
# Done logging <3

# $ cat log/rack.log
# 127.0.0.1 - - [27/Sep/2013 11:38:26] "GET / HTTP/1.1" 200 - 0.0002
