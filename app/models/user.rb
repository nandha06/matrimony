class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :religion
  belongs_to :caste
  belongs_to :language
  #attr_accessible :user_name, :age, :email, :phone_no
  
  def self.search(age_from, age_to, gender)
  	age_from1 = (age_from).to_i
  	age_to1 = (age_to).to_i

  	#return scoped unless search.present?
  	where("age >= ? and age <= ? and gender = ?", age_from1, age_to1, "#{gender}") 

  	#if params[:age]
	#	find(:all, :condition => ['age = ', "%#{search}%"])
	#else
	#	find(:all)
	end
end
