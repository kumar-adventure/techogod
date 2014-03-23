class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.references :user, index: true
      t.references :afinity, index: true

      t.timestamps
    end
  end
end
