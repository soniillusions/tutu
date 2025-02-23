class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    flash.delete(:notice)
    super
  end

  def after_sign_out_path_for(resource_or_scope)
    flash.delete(:notice)
    super
  end
end
