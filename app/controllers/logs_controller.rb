class LogsController < ApplicationController
	public
		def index
			@logs = Log.all
		end

		def create
			@logs = Log.new(log_params)
			@logs.created_at = Time.zone.now # write current date/time
			@logs.ip = Socket::getaddrinfo(Socket.gethostname, "echo", Socket::AF_INET)[0][2] #write ip 
			@logs.save # update db

			@str = "Hello, #{params[:log][:username]}!" # write "hello"

			render 'welcome/index'
		end

	private
		def log_params
			params.require(:log).permit(:username, :created_at, :ip)
		end
end