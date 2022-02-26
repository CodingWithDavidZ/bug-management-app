class AuthController < ApplicationController
  require_relative '/assets/.firebase_api_key.rb'
  require 'net/http'

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

    uri = URI('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key='+API_key)

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

    uri = URI('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key='+API_key)
    

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

  def get_public_key
        uri = URI('https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com')
        response = Net::HTTP.get(uri)
        slice = response.slice(/\"(.*?):/,1)
        key = slice.chomp("\"")
        return key
    end

end
