class InfoProfissional < ActiveRecord::Base
	include ActiveModel::Validations

	has_many :atividades
	belongs_to :cv
	validates_presence_of :inicio, :fim, :empresa, :cargo, :cv_id, :atividades
	validates_with DatePeriodValidator, :if => lambda{self.inicio and self.fim}


end
