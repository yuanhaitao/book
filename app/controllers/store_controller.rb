class StoreController < ApplicationController
 skip_before_filter :authorize
  def index
  	@books=Book.all
  	 
  end
end
