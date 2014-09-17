class Qualificacao < ActiveRecord::Base
	belongs_to :cv
	validates_presence_of :descricao
end
