# Kontroler dla Account
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :users_qr_codes]

  def show; end

  def users_qr_codes
    @qr_codes = @user.qr_codes
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end