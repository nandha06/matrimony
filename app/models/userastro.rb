class Userastro < ActiveRecord::Base
	belongs_to :user
	belongs_to :gothram
	belongs_to :rasi
	belongs_to :nakshatra
end
