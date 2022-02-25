class AuthController < ApplicationController
  def index
    if session[:user_id]
      render json: { status: 200, message: 'You are logged in' }
    else
      render json: { status: 401, message: 'You are not logged in' }
    end
  end

  #Handling Auth from Firebase
  def signup
    email = params[:email]
    password = params[:password]

    uri = URI('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=')

    res = Net::HTTP.post_form(uri, {'email' => email, 'password' => password)

    data = JSON.parse(res.body)

    if res.is_a?(Net::HTTPSuccess)
      render json: data
    else
      render json: data
    end

  end

  def login
    email = params[:email]
    password = params[:password]

    uri = URI('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDFyie8OD67Zere7FLdE5KU7ffodL5AigU')
    https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key

    res = Net::HTTP.post_form(uri, {'email' => email, 'password' => password})
    data = JSON.parse(res.body)

    if res.is_a?(Net::HTTPSuccess)
      render json: data
    else
      render json: data
    end

  end

  def logout
    session.clear
    if session == {}
      render json: { status: 200, message: 'You are logged out' }
    else
      render json: { status: 401, message: 'You are not logged out' }
    end
  end

  private

  def API_key
    'AIzaSyDFyie8OD67Zere7FLdE5KU7ffodL5AigU'
  end



end
