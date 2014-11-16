require 'digest/sha2'
class User < ActiveRecord::Base
  #attr_accessible :hashed_password, :name, :salt,:password,:password_confirmation
  attr_accessible :name, :password, :password_confirmation
  validates :name, :presence =>true, :uniqueness =>true, length:{in: 6...40}
  validates :password, :confirmation =>true,:presence =>true,length:{in: 6...40}
  attr_accessor :password_confirmation
  attr_reader :password,:password_present
  def User.authenticate(name,password)
  	if user =find_by_name(name)
  		if user.hashed_password==encrypt_password(password,user.salt)
  			user
  			end
  		end
  	end
  	
  	def User.encrypt_password(password,salt)
  		Digest::SHA2.hexdigest(password+"wibble"+salt)
  	end
 
  	def password=(password)
  		 @password=password
  		if password.present?
  			generate_salt
  			self.hashed_password=self.class.encrypt_password(password,salt)
  		end
  	end


  private
  def password_present
  	errors.add(:password,"Missing password") unless hashed_password.present?
  end

  def generate_salt
  	self.salt=self.object_id.to_s+rand.to_s
  end


end