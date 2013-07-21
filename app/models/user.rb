class User < ActiveRecord::Base
	has_many :user_skills
	has_many :skills, through: :user_skills

	def proficiency_for(skill)
		self.user_skills.find_by_skill_id(skill.id).rating
	end

	def set_proficiency_for(skill, rating)
		self.user_skills.create(skill_id: skill.id, rating: rating)
	end
end
