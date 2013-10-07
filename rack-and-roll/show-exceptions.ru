use Rack::ShowExceptions

run lambda { |env|
  raise "hell!"
}

# curl http://localhost:9292/

# show-exceptions.png
