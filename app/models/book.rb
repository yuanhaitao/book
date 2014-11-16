class Book < ActiveRecord::Base
  attr_accessible :author, :date, :book_press,:description, :image_url, :price, :title, :comments
   validates :author, :date, :description, :image_url, :price, :title, :presence =>true
   validates :title, :uniqueness =>true
   validates :image_url,:format =>{
  	:with =>%r{\.(gif|jpg|png)$}i,
  	:message =>'must be a url for gif,jpg or png image.'}
   validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
 has_many :comments

end
