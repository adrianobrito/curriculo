class Cv < ActiveRecord::Base
	has_many :info_academicas
	has_many :info_profissionals
	
end
