class InfoAcademica < ActiveRecord::Base
	include ActiveModel::Validations

	belongs_to :cv
	validates_presence_of :nivel, :incompleto, :instituicao
	validates_presence_of :curso, :unless => lambda{ self.ensino_fundamental? or self.ensino_superior_pos_graduacao? }
	
	enum nivel: [:ensino_fundamental, :ensino_medio, :ensino_superior_graduacao, :ensino_superior_pos_graduacao]

end
