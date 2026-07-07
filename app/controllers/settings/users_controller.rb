class Settings::UsersController < Settings::BaseController
    def show
    end

    def destroy
        terminate_session
        Current.user.destroy
        redirect_to root_path, status: :see_other, notice: "Your account has been deleted."
    end
end