require "date"

run lambda { |env|
  headers = { "Content-Type" => "text/plain" }
  date = Date.today.strftime("%d/%m/%y")

  [200, headers, ["Hello there, today is #{date}\n"]]
}

# curl http://localhost:9292/

# Hello there, today is 27/09/13
