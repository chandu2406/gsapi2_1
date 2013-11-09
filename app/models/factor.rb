class Factor < ActiveRecord::Base

	has_many :reviews
	belongs_to :houses

end
