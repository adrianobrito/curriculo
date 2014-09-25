require 'rails_helper'
require 'digest'

describe Cv, :type => :model do
	

	it "deve ser salvo" do
		cv = create_cv
		cv.save

		cv.should be_valid
	end

	it "deve ser invalido sem informacao de usuario" do
		cv = create_cv
		cv.info_usuario = nil
		cv.save

		cv.should be_invalid
	end

	it "deve ser invalido sem informacao de pessoal" do
		cv = create_cv
		cv.info_pessoal = nil
		cv.save

		cv.should be_invalid
	end

	it "deve ser invalido sem informacoes academica" do
		cv = create_cv
		cv.info_academicas = []
		cv.save

		cv.should be_invalid
	end	

	def create_cv
		FactoryGirl.build(:cv)
	end


end	
