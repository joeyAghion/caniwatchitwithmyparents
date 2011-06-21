class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies, :force => true do |t|
      t.string :name, :limit => 64
      t.string :rating, :limit => 6
      t.timestamps
    end
    
    add_index :movies, :name
  end

  def down
    drop_table :movies
  end
end