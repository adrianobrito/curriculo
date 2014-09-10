class InfoPessoal < ActiveRecord::Base
	belongs_to :cv
	validates_presence_of :cpf, :nome, :nacionalidade, 
						  :estadoCivil, :endereco, :numeroEndereco, 
						  :complemento, :bairro, :cidade, :estado, :telefone, :cv_id 

	enum estadoCivil: [:solteiro, :casado]

end
