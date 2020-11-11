#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
		validates :name, presence: true
		validates :phone, presence: true
		validates :datestamp, presence: true
		validates :barber, presence: true
		validates :color, presence: true
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

	с = Client.create params[:client]
	

	
	erb "<h2>Вы записались!</h2>"

end