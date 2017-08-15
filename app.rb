require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, 'sqlite3:barbershop.db'

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
  @barbers = Barber.all
end


# === GET ===

get '/' do
  erb :index
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end



# === POST ===

post '/visit' do

  c = Client.new params[:client]
  c.save

  erb "<h2>Спасибо. Вы записались.</h2>"
end

post '/contacts' do
  name = params[:name]
  phone = params[:phone]
  email = params[:email]
  message = params[:message]

  Contact.create(name: name, phone: phone, email: email, message: message)

  erb "<h2>Спасибо. Мы свяжемся с вами в ближайшее время.</h2>"
end