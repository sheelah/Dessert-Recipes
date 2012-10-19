class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def up
  	change_table :recipes do |t|
      t.change :data, :binary
    end
  end

  def down
  	 change_table :recipes do |t|
      t.change :data, :string
    end
  end
end
