class CreateQualificacoes < ActiveRecord::Migration
  def change
    create_table :qualificacoes do |t|
      t.string :descricao
      t.belongs_to :cv
      t.timestamps
    end
  end
end
