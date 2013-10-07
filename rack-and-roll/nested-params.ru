require "json"
require "rack/contrib/nested_params"

use Rack::NestedParams

run lambda { |env|
  req = Rack::Request.new(env)
  headers = { "Content-Type" => "application/json" }
  body = JSON.generate(req.params["user"])

  [200, headers, [body]]
}

# curl http://localhost:9292 -d user[first_name]=John -d user[last_name]=Doe

# {"first_name":"John","last_name":"Doe"}
