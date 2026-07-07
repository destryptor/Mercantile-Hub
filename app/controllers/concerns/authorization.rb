module Authorization
    extend ActiveSupport::Concern

    class_methods do
        def admin_access_only(**options)
            before_action -> { redirect_to root_path, alert: "You are not authorized to access this page." unless authenticated? && Current.user.admin?}, **options
        end
    end
end