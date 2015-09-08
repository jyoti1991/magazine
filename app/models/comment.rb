class Comment < ActiveRecord::Base
	 acts_as_tree order: 'created_at DESC'
	 def to_digraph_label
  commenter
end   
	    	  belongs_to :article
  belongs_to :user
 end
