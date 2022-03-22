class CreateTasks < ActiveRecord::Migration[5.2]
	def change
	  create_table :tasks do |t|
		t.string :name, :null => false
		t.text :description
		t.datetime :start
		t.datetime :due

		t.timestamps null: false
	  end
	end
end