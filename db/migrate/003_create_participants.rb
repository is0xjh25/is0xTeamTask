class CreateParticipants < ActiveRecord::Migration[5.2]
	create_table :participants, :id => false do |t|
		t.belongs_to :member
		t.belongs_to :task

		t.timestamps null: false
 	end
end