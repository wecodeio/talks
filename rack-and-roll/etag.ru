use Rack::ETag, nil, "public, max-age=0"

run lambda { |env|
  headers = { "Content-Type" => "text/plain" }
  [200, headers, ["Response tagged!\n"]]
}

# curl --verbose http://localhost:9292/
# ..
# < Etag: "f12456e2b868c9cb1f52e42b3d92ad3f"
# < Cache-Control: public, max-age=0
# ..
# Response tagged!
