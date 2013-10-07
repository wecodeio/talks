class Timer
  def initialize(app)
    @app = app
  end

  def call(env)
    t = Time.now
    status, headers, response = @app.call(env)
    time_elapsed_in_secs = Time.now - t

    buffer = ""
    response.each { |str| buffer << str }
    buffer << ("Time elapsed: %.3f secs\n" % time_elapsed_in_secs)

    [status, headers, [buffer]]
  end
end


# curl http://localhost:9292/

# I'm done here.
# Time elapsed: 0.763 secs
