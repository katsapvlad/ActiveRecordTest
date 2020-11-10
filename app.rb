#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base

end

class Barber < ActiveRecord::Base

end

before do 
	@barbers = Barber.all
end

get '/' do
	@barbers = Barber.order "created_at DESC"
	erb :index		
end

get '/visit' do
	@barbers = Barber.order "created_at DESC"
	erb :visit
end

post '/visit' do

	с = Client.new

	#@barbers = Barber.order "created_at DESC"
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	client = Client.create (
		:name => @username, 
		:phone => @phone, 
		:datestamp => @datetime,
		:barber => @barber,
		:color => @color
	)

	erb "<h2>Вы записались!</h2>"

end