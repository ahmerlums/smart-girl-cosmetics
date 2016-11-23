class UsersController < ApplicationController
   before_action :require_admin, only: [:index,:show]
def new
  @user = User.new
end

def create
  @user = User.new(params[:user])
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
end

def cart 
  flash[:notice] = 0
  
end
def checkout
  Order.where(customerID: params[:custid], status: "pending").each do |order|
       order.update_attributes(:status => 'processed')
      
  end
   redirect_to('/');
end

end
