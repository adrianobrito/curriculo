class InfoProfissional < ActiveRecord::Base
	include ActiveModel::Validations

	has_many :atividades
	belongs_to :cv
	validates_presence_of :inicio, :fim, :empresa, :cargo, :atividades
	validates_with DatePeriodValidator, :if => lambda{self.inicio and self.fim}
	accepts_nested_attributes_for :atividades, allow_destroy: true
	

end
