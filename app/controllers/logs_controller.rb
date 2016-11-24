class LogsController < ApplicationController
  def create
  	@log = Log.new(log_params)
  	@log.ip = Socket::getaddrinfo(Socket.gethostname, "echo", Socket::AF_INET)[0][2] #write ip 
    @log.created_at = Time.now # write current date/time
    @log.save # update db

    @str = "Hello, " + params[:log][:username] + "!" # write "hello"

    render "welcome/index"
  end

  private
  	def log_params
  		params.require(:log).permit(:username, :created_at, :ip)
  	end
end