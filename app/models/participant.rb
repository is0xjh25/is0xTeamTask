class Participant < ActiveRecord::Base
	
	belongs_to :member
    belongs_to :task

	def to_s
		return self.member.to_s + " in " + self.task.to_s
	end

	def info
		return { id: self.id, info: self.to_s }
	end

	def self.all_info
		records = []
		self.all.each {|p| records.push(p.info)}
		return records
	end

	def self.count_members(task)
		return Participant.where(task_id: task).count
	end

	def self.count_tasks(member)
		return Participant.where(member_id: member).count
	end
end