class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
  
  private

  def flash_notice(message)
    flash[:notice] = message
  end

  def flash_alert(message)
    flash[:alert] = message
  end

  def flash_notice_now(message)
    flash.now[:notice] = message
  end

  def flash_alert_now(message)
    flash.now[:alert] = message
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

end
