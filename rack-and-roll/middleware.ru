require "json"

require "./middleware/authentication"
require "./middleware/response_to_json"

use Middleware::Authentication
use Middleware::ResponseToJSON

run lambda { |env|
  current_user = env["current_user"]
  body = { auth_token: (current_user ? current_user.auth_token : nil) }
  [200, {}, [JSON.generate(body)]]
}

# curl http://localhost:9292/

# {"auth_token":null}


# curl --verbose -H "X-Auth-Token: 123" http://localhost:9292/private

# ..
# < Content-Type: application/json
# ..
# {"auth_token":"123"
