class CreateAfinities < ActiveRecord::Migration
  def change
    create_table :afinities do |t|
      t.string :name

      t.timestamps
    end
  end
end
