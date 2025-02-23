# frozen_string_literal: true

module Admin
  class UsersController < BaseController
    before_action :require_authentication
    before_action :set_user!, only: %i[edit update destroy]
    before_action :authorize_user!
    after_action :verify_authorized

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit;end

    def create
      @user = User.new(user_params)

      if @user.save
        flash[:success] = 'Пользователь создан!'
        redirect_to admin_users_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @user.update(user_params)
        flash[:success] = 'Пользователь обновлен!'
        redirect_to admin_users_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      flash[:success] = 'User deleted!'
      redirect_to admin_users_path
    end

    private

    def set_user!
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation, :role)
    end

    def authorize_user!
      authorize(@user || User)
    end
  end
end
