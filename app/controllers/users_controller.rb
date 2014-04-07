class UsersController < ApplicationController
   before_filter :authenticate_admin!
  
  # def index #for public videos
  # 	@user_info = Vimeo::Simple::User.videos("user25247730") 
  # end


  def index #for private videos
	  	@base = Vimeo::Advanced::Base.new("48315613d6a6df52a740c1b44038453a5f61300e", "5daf0e2a00cdd9df59bb6e58ccca4e344ddc03da")
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
    base = Vimeo::Advanced::Base.new("48315613d6a6df52a740c1b44038453a5f61300e", "5daf0e2a00cdd9df59bb6e58ccca4e344ddc03da")
    access_token = base.get_access_token(params[:oauth_token], session[:oauth_secret], params[:oauth_verifier])
    @user_token = access_token.token
    @user_secret = access_token.secret
  end

  def video_details
    #video = Vimeo::Advanced::Video.new("consumer_key", "consumer_secret", :token => user.token, :secret => user.secret)
  end
end
