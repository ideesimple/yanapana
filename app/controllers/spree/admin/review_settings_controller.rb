class Spree::Admin::ReviewSettingsController < Spree::Admin::BaseController

  def update
    Spree::Config.set(params[:preferences])

    respond_to do |format|
      format.html {
        redirect_to admin_review_settings_path
      }
    end
  end

end
