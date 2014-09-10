class CreateInfoPessoals < ActiveRecord::Migration
  def change
    create_table :info_pessoals do |t|
      t.string :cpf
      t.string :nome
      t.string :nacionalidade
      t.integer :estadoCivil
      t.string :endereco
      t.string :numeroEndereco
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :telefone
      t.integer :curriculo_id

      t.timestamps
    end
  end
end
