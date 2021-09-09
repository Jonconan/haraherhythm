# frozen_string_literal: true

class Artists::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    mypage_path
  end

end
