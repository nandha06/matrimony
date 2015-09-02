class Habit < ActiveRecord::Base
	enum diet: [ :vegetarian, :non_vegetarian, :eggetarian]
	enum drinking: [ :non_drinker, :regular_drinker, :social_drinker]
	enum smoking: [ :non_smoker, :regular_smoker, :social_smoker]
end
