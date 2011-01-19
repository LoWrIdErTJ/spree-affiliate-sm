UsersController.class_eval do

  def update
    @user = current_user
    @user.full_name = params[:user]["full_name"]
    @user.phone = params[:user]["phone"]
    @user.website = params[:user]["website"]
    if @user.update_attributes(params[:user])
      flash[:notice] = t("account_updated")
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end
