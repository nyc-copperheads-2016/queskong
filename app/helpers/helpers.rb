require 'time'

helpers do

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def long_form_date(timestamp)
    timestamp.strftime('%B %e, %Y')
  end

  def greeting_and_time_of_day
    t = Time.now
    if t.hour < 12
      "Good Morning, #{current_user.username}"
    elsif t.hour > 12 && t.hour < 17
      "Good Afternoon, #{current_user.username}"
    else
      "Good Evening, #{current_user.username}"
    end
  end

end
