class UserQualification < ActiveRecord::Base
	belongs_to :user
	belongs_to :education_field
	belongs_to :education_level
	belongs_to :education
	belongs_to :occupation
	belongs_to :annual_income
end
