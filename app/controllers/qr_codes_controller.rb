class QrCodesController < ApplicationController
  before_action :set_qr_code, only: [:show, :update, :destroy]

  def index
    @qr_codes = QrCode.all
  end

  def show; end

  def create
    @qr_code = QrCode.new(qr_code_params)

    if @qr_code.save
      render :show, status: :created, location: @qr_code
    else
      render json: @qr_code.errors, status: :unprocessable_entity
    end
  end

  def update
    if @qr_code.update(qr_code_params)
      render :show, status: :ok, location: @qr_code
    else
      render json: @qr_code.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @qr_code.destroy
  end

  private

  def set_qr_code
    @qr_code = QrCode.find(params[:id])
  end

  def qr_code_params
    params.require(:qr_code).permit(:user_id, :title, :url)
  end
end
