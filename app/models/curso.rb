class Curso < ActiveRecord::Base
	include ActiveModel::Validations

	belongs_to :cv
	validates_presence_of :descricao, :inicio, :fim, :instituicao
	validates_with DatePeriodValidator, :if => lambda{self.inicio and self.fim}

end
