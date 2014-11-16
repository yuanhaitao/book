class Comment < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  attr_accessible :content,:user
end
