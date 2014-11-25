class AddLoginToInfouser < ActiveRecord::Migration
  def change
  	add_column :info_usuarios, :login, :string
  end
end
