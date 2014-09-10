require 'rails_helper'
require 'digest'

describe Cv, :type => :model do
	
	it "deve ser salvo" do
		cv = create_cv
		cv.should be
	end

	private
		def create_cv
			Cv.create({})
		end

end	
