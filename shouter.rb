#encoding: utf-8

require 'rubygems'
require 'active_record'

require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :port, 3003
set :bind, '0.0.0.0'

enable :sessions

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

# ---------- CLASSES DEFINITION ---------

class User < ActiveRecord::Base

	has_many :shouts

	validates :name, :handle, presence: true	
	validates :handle, uniqueness: true, format: { with: /\A[a-z]+\z/, message: "only allows downcase letters" }
	validate :handle_validation
	validates :password, length: { is: 20 }

	private
	def handle_validation
		unless handle.split(" ").length != 1
			errors.add(:handle, 'handle should be only one word')
		end
	end
end

class Shout < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :message, :user, :created_at
	validates :message, length: { in: 1..200 }
  	validate :created_at_fulfilling, on: :create
  	validate :likes_init, on: :create

  	private
  	def created_at_fulfilling
  		self.created_at = Time.now
  	end

  	def likes_init
  		self.likes = 0
  	end
end


# ---------- ROUTES DEFINITION ----------

# A password, which must be present and will be generated randomly when creating a User. It will be 20 characters long and unique.
# A likes counter, which must be an integer, at least 0. Every like will increase this parameter

get '/' do
	@users = User.all
	@shouts = Shout.order(created_at: :desc)
	erb :mainview
end