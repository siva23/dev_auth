class UsersController < ApplicationController
   before_filter :authenticate_admin!
  
  # def index #for public videos
  # 	#@user_info = Vimeo::Simple::User.videos("user25247730") 
  #   @user_info = Vimeo::Simple::User.videos("user9436893") 
  # end


  def index #for private videos
	  	@base = Vimeo::Advanced::Base.new("6e5c231d7fe43552b47b7dbd2971a795d5bbc3ca", "7f54ccb85f39876529230420e73c34ac75a63c9d")
	  	puts "#{@base.inspect}//////////////////////////////"
	  	request_token = @base.get_request_token
	  	puts "#{request_token}////////////////////////////////"
	  	session[:oauth_secret] = request_token.secret
	  	redirect_to @base.authorize_url
  end

  def new
  end

  def show
  end

  def get_details
    base = Vimeo::Advanced::Base.new("6e5c231d7fe43552b47b7dbd2971a795d5bbc3ca", "7f54ccb85f39876529230420e73c34ac75a63c9d")
    access_token = base.get_access_token(params[:oauth_token], session[:oauth_secret], params[:oauth_verifier])
    @user_token = access_token.token
    @user_secret = access_token.secret
  end

  def video_details
    #video = Vimeo::Advanced::Video.new("consumer_key", "consumer_secret", :token => user.token, :secret => user.secret)
  end
end
