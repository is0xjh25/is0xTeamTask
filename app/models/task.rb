class Task < ActiveRecord::Base
	
	has_many :participants
    has_many :members, through: :participants

	# validation
	validates :name, presence: true
	validate :due_date_is_after_start_date
	
	def to_s
		return self.name
	end

	def info
		return { id: self.id, name: self.to_s, start: self.start.to_s[0...-4], due: self.due.to_s[0...-4], description: self.description }
	end

	def self.all_info
		tasks = []
		self.all.each {|task| tasks.push(task.info)}
		return tasks
	end

	private

	def due_date_is_after_start_date
		return if due.blank? || start.blank?

		if due < start
			errors.add(:due, "date cannot be before the start date") 
		end 
	end
end