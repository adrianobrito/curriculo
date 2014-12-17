FactoryGirl.define do
  factory :info_pessoal do
    cpf '03576025367'
	nome 'Adriano Sousa de Brito Bispo'
	nacionalidade 'Brasileiro'
	estadoCivil :casado 
	endereco 'Rua Costa Sousa'
	numeroEndereco '71'
	complemento 'Apartamento C'
	bairro 'Benfica'
	cidade 'Fortaleza'
	estado 'Ceará'
	telefone '(85)89405519'
	nascimento Date.new(1990,01,01)
  end
end
