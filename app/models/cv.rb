class Cv < ActiveRecord::Base

	validates_presence_of :info_pessoal, :info_usuario
	validate :deve_possuir_informacoes_academicas

	has_one :info_pessoal
	has_one :info_usuario
	has_many :info_academicas
	has_many :info_profissionals
	has_many :cursos 
	has_many :qualificacaos
	
	def deve_possuir_informacoes_academicas
		errors.add(:info_academicas, "Você precisa informar alguma informação acadêmica")	if info_academicas.empty?
	end

end
