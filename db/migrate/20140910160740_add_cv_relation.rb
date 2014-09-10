class AddCvRelation < ActiveRecord::Migration
  def change
  	change_table :cvs do |t|
      t.belongs_to :cvs
    end
  end
end
