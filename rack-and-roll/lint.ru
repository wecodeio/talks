use Rack::Lint

run lambda { |env|
  headers = { "Content-Type" => "text/plain" }

  [99, headers, ["Wrong status code.\n"]]
}

# curl http://localhost:9292/

# Rack::Lint::LintError: Status must be >=100 seen as integer
