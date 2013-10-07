require "./timer"

use Timer

run lambda { |env|
  headers = { "Content-Type" => "text/plain" }
  sleep(rand)

  [200, headers, ["I'm done here.\n"]]
}
