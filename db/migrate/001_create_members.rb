class CreateMembers < ActiveRecord::Migration[5.2]
	def change
	  create_table :members do |t|
		t.string :email, :null => false
		t.string :phone, :null => false	
		t.string :first_name, :null => false
		t.string :last_name, :null => false

		t.timestamps null: false
	  end
	end
end
