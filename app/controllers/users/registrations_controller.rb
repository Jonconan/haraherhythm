# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @user = User.new(user_params)
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.password = params[:user][:password]
      if @user.valid?
        @user.save!
        sign_in @user
        redirect_to root_path
      else
        render :new
      end
    else
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    if current_user.update(user_params)
      redirect_to mypage_path
    else
      render :new
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def user_params
    params.require(:user).permit(
      :email, :name, :nickname, :thumbnail,
      :postal_code, :address_1, :address_2, :address_3
    )
  end
end
