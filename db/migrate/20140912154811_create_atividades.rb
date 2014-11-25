class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.string :descricao
      t.belongs_to :info_profissionais

      t.timestamps
    end
  end
end
