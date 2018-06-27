require_relative './config/init.rb'
set :run, true

get '/' do
  @name = "Bob Smith"
  @time = Time.now
  erb :"home"
end

get '/sign_up' do
  erb :"sign_up"
end

post '/signup' do
  user = User.new(params[:user])

  if user.save 
    # brings to another page
  	redirect '/'
  else
    puts "Username has been used. Please find another."
  end

end  

get '/login' do
	erb :"login"
end


post '/login' do
	user = User.find_by(email: params[:user][:email])

  # apply a authentication method to check if a user has entered a valid email and password
  	if user && user.authenticate(params[:user][:password])
  # if a user has successfully been authenticated, you can assign the current user id to a session
  	session[:user_id] = user.id
  # redirect '/'
  else
  	redirect '/login'
  end
end

post '/logout' do
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
end