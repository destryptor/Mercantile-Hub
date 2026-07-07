class SignUpsController < ApplicationController
    unauthenticated_access_only
    rate_limit to: 10, within: 3.minutes, only: :create, with: -> {redirect_to sign_up_path, alert: "Try again later."}
    def show
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            start_new_session_for(@user)
            redirect_to root_path, notice: "Welcome, #{@user.full_name}!"
        else
            render :show, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
    end
end