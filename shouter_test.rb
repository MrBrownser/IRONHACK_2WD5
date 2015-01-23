require_relative 'shouter'
require 'securerandom'

describe User do
	before do
	  	@user = User.new
	  	@user.name = "Leandro Gado"
	  	@user.handle = "legusta"
	  	@user.password = SecureRandom.random_number(36**12).to_s(36).rjust(20, "0")
  	end

	it "should be valid with correct data" do
		expect(@user.valid?).to be_truthy
	end

	describe :name do
		it "should be invalid if it's missing" do
			@user.name = nil
			expect(@user.valid?).to be_falsy
	    end
	end

	describe :handle do
	    it "should be invalid if it has 2 words" do
			@user.handle = "no le disgusta"
			expect(@user.valid?).to be_falsy
	    end
	  end

	describe :handle_unique do
	    it "should be invalid if handle is not unique" do
	    	another_user = User.take
			@user.handle = another_user.handle
			expect(@user.valid?).to be_falsy
	    end
	end  

	describe :password do
	    it "should be invalid if it's not 20 characters long" do
			@user.password = SecureRandom.random_number(36**12).to_s(36).rjust(10, "0")
			expect(@user.valid?).to be_falsy
	    end
	end
end

describe Shout do
	before do
	  	@shout = Shout.new
	  	@shout.message = "This is a shout test text. Only for testing purposes"
	  	@shout.user_id = 1
	  	@shout.created_at = Time.now
	  	@shout.likes = 0
  	end

	it "should be valid with correct data" do
		expect(@shout.valid?).to be_truthy
	end

	describe :message_short do
		it "should be invalid if the message has less than 0 characters" do
			@shout.message = ""
			expect(@shout.valid?).to be_falsy
		end
	end

	describe :message_long do
		it "should be invalid if the message has more than 200 characters" do
			@shout.message = (0...201).map { ('a'..'z').to_a[rand(26)] }.join
			expect(@shout.valid?).to be_falsy
		end
	end

	describe :created_at do
		it "should be invalid if don't have the created_at timestamp" do
			@shout.created_at = nil
			expect(@shout.valid?).to be_falsy
		end
	end

	describe :user_id do
		it "should be invalid if the message has no user_id related (from the session)" do
			@shout.user_id = nil
			expect(@shout.valid?).to be_falsy
		end
	end
end