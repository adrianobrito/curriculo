class Atividade < ActiveRecord::Base

	validates_presence_of :descricao
	belongs_to :info_profissional
end
