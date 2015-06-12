# Rack::Timeout.timeout = 5

class TimeoutRestartResquest
	def initialize(app)
		@app = app
	end
	
	def call(env)
		thr = Thread.new do
			Rails.logger.debug "Comecou #{env['REQUEST_PATH']}"
      sleep 5 # set this to Unicorn timeout - 1
      unless Thread.current[:done]
				Rails.logger.debug "DEU TIMEOUT"
				ActiveRecord::Base.connection.reset!
				@app.call(env)
      end
    end
    @app.call(env)
  ensure
    thr[:done] = true
    thr.run
	end
end