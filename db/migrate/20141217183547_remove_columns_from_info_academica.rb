class RemoveColumnsFromInfoAcademica < ActiveRecord::Migration
  def change
  	remove_column :info_academicas, :inicio
  	remove_column :info_academicas, :fim
  end
end
