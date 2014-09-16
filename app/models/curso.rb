class Curso < ActiveRecord::Base

	belongs_to :cv
	validates_presence_of :descricao, :inicio, :fim, :cv_id, :instituicao
	validate :data_inicio_nao_pode_ser_maior_que_data_fim, :if => lambda{self.inicio and self.fim}

	def data_inicio_nao_pode_ser_maior_que_data_fim
		errors.add(:inicio, "Data do Início não pode ser maior que a data do fim") if self.inicio > self.fim 
	end

end
