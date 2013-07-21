class Skill < ActiveRecord::Base
	has_many :user_skills
	has_many :users, through: :user_skills

	validates_uniqueness_of :name

	def user_with_proficiency(rating)
		User.find(UserSkill.find_by_rating(rating).user_id)
	end
end
