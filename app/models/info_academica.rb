class InfoAcademica < ActiveRecord::Base
	
	belongs_to :cv
	validates_presence_of :nivel, :curso, :incompleto, :instituicao, :inicio, :fim, :cv_id

	enum nivel: [:ensino_fundamental, :ensino_medio, :ensino_superior_graduacao, :ensino_superior_pos_graduacao]

end
