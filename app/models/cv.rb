class Cv < ActiveRecord::Base

	has_one :info_pessoal
	has_one :info_usuario
	has_many :info_academicas
	has_many :info_profissionals
	has_many :cursos 
	has_many :qualificacaos
	
end
