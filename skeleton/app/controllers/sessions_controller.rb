class SessionsController < ApplicationController 
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = @user.find_by_credentials(params[:username], params[:password])
    if @user
      redirect_to user_url(@user)
    else
      render json: ["Invalid credentials"]
    end
  end
  
  def destroy
    
  end
  
end