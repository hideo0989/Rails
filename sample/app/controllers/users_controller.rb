class UsersController < ApplicationController
#userの個人ページ
  def show
    @user = User.find(params[:id])
    # debugger
  end
#userの新規登録
  def new
    @user = User.new
  end
#
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Sample App!"
      # redirect_to user_url(@user)
      redirect_to @user
    else
      #保存の失敗
      render'new'
    end
  end

private

  #マスアサインメントを防止するコード
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

end
