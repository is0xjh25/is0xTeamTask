class Member < ActiveRecord::Base
	
	has_many :participants
    has_many :tasks, through: :participants

	# validation
	VALID_NAME_REGEX = /[a-z\s.-]/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	VALID_PHONE_REGEX = /\A\d{10}\z/
	validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: "should not contain numbers or symbols" }
	validates :last_name, presence: true, format: { with: VALID_NAME_REGEX, message: "should not contain numbers or symbols" }
	validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "invalid email"}
	validates :phone, presence: true, uniqueness: true, format: { with: VALID_PHONE_REGEX, message: "invalid number"}

	def to_s
		return self.first_name + " " + self.last_name
	end

	def info
		return { id: self.id, name: self.to_s, email: self.email, phone: self.phone}
	end

	def self.all_info
		members = []
		self.all.each {|member| members.push(member.info)}
		return members
	end
end