class InfoAcademica < ActiveRecord::Base
	
	belongs_to :cv
	validates_presence_of :nivel, :incompleto, :instituicao, :inicio, :fim, :cv_id
	validates_presence_of :curso, :unless => lambda{ self.ensino_fundamental? or self.ensino_superior_pos_graduacao? }
	validate :data_inicio_nao_pode_ser_maior_que_data_fim, :if => lambda{self.inicio and self.fim}

	enum nivel: [:ensino_fundamental, :ensino_medio, :ensino_superior_graduacao, :ensino_superior_pos_graduacao]

	def data_inicio_nao_pode_ser_maior_que_data_fim
		errors.add(:inicio, "Data do Início não pode ser maior que a data do fim") if self.inicio > self.fim 
	end


end
