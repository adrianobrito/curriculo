class RemoveInfoProfissionaisIdAndAddNew < ActiveRecord::Migration
  def change
  	drop_table :info_profissionais
  	remove_column :atividades, :info_profissionais_id
  end
end
