class House < ActiveRecord::Base

	has_many :reviews
	has_many :factors

end
