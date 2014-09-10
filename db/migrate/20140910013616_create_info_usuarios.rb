class CreateInfoUsuarios < ActiveRecord::Migration
  def change
    create_table :info_usuarios do |t|
      t.string :email
      t.string :senha
      t.integer :cv_id
      
      t.timestamps
    end
  end
end
