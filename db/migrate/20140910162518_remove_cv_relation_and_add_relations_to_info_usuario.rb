class RemoveCvRelationAndAddRelationsToInfoUsuario < ActiveRecord::Migration
  def change

  	remove_column :cvs, :cvs_id
  	remove_column :info_usuarios, :cv_id
  	
  	change_table :info_usuarios do |t|
      t.belongs_to :cv
    end

  end
end
