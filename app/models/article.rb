class Article < ActiveRecord::Base
	validates :title,:body,:author,:uniqueness =>true, :presence => true,length: { minimum: 3 }
		belongs_to :user
has_many :comments, dependent: :destroy             
end
