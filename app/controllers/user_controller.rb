post '/users' do
  user = User.new(params)
  if user.save
    redirect '/'
  else
    redirect '/users/new', locals: { errors: user.errors.full_messages }
  end
end

get '/users/new' do
  erb :'/users/form'
end

get '/users' do
  erb :'/users/index'
end

get '/users/:id' do
  user = User.find_by(id: session[:user_id])
  erb :'/users/show', locals: {user: user}
end
