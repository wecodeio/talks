module Middleware
  class Authentication
    PUBLIC_ENDPOINTS = { "GET" => %w(/) }.freeze

    class User < Struct.new(:auth_token); end

    def initialize(app)
      @app = app
    end

    def call(env)
      dup.call!(env)
    end

    def call!(env)
      @req = Rack::Request.new(env)
      status, headers, response = if public? || current_user(env["HTTP_X_AUTH_TOKEN"])
                                    env["current_user"] = @current_user
                                    @app.call(env)
                                  else
                                    [401, {}, []]
                                  end
      [status, headers, response]
    end

  private

    def public?
      PUBLIC_ENDPOINTS.any? do |verb, endpoints|
        verb == @req.request_method &&
          endpoints.include?(@req.path)
      end
    end

    def current_user(auth_token)
      unless instance_variable_defined?(:@current_user)
        @current_user ||= User.new(auth_token) if auth_token
      end
      @current_user
    end
  end
end
