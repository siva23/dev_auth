class UsersController < ApplicationController
   before_filter :authenticate_admin!
  
  def index #for public videos
  	@user_info = Vimeo::Simple::User.videos("user25247730") 
  end


 #  def index #for private videos
 #  	# if params[:oauth_token]
 #  	# 	render :text => params.inspect
 #  	# else
	#   	@base = Vimeo::Advanced::Base.new("48315613d6a6df52a740c1b44038453a5f61300e", "5daf0e2a00cdd9df59bb6e58ccca4e344ddc03da")
	#   	puts "#{@base.inspect}//////////////////////////////"
	#   	request_token = @base.get_request_token
	#   	puts "#{request_token}////////////////////////////////"
	#   	session[:oauth_secret] = request_token.secret
	#   	redirect_to @base.authorize_url
	# #end
 #  end

  def new
  end

  def show
  end

  def get_details
  	base = Vimeo::Advanced::Base.new("48315613d6a6df52a740c1b44038453a5f61300e", "5daf0e2a00cdd9df59bb6e58ccca4e344ddc03da")
	oauth_token="0f3d6edf22cb65ab2eca492d3604e4b6"
	access_token = base.get_access_token(oauth_token, session[:oauth_secret], "group-bjktd")

	# You'll want to hold on to the user's access token and secret. I'll save it to the database.
	user_token = access_token.token
	user_secret = access_token.secret
  	
  	@video = Vimeo::Advanced::Video.new("48315613d6a6df52a740c1b44038453a5f61300e", "5daf0e2a00cdd9df59bb6e58ccca4e344ddc03da", :token => user_token, :secret => user_secret)
  end
end
