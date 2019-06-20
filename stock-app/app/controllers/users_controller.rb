class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # binding.pry
        @user = User.create(user_params)
        signin(@user)
        redirect_to user_transactions_path(@user.id)
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end