module Middleware
  class ResponseToJSON
    def initialize(app)
      @app = app
    end

    def call(env)
      dup.call!(env)
    end

    def call!(env)
      status, headers, response = @app.call(env)
      headers["Content-Type"] = "application/json"

      [status, headers, response]
    end
  end
end
