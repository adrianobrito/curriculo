class InfoAcademica < ActiveRecord::Base
	
	belongs_to :cv
	validates_presence_of :nivel, :incompleto, :instituicao, :inicio, :fim, :cv_id
	validates_presence_of :curso, :unless => lambda{ self.ensino_fundamental? or self.ensino_superior_pos_graduacao? }

	enum nivel: [:ensino_fundamental, :ensino_medio, :ensino_superior_graduacao, :ensino_superior_pos_graduacao]

end
