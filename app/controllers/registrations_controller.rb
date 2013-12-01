class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
  end

  def create
    @registration = Registration.new(registration_params)

    if @registration.save
      render json: {:name => @registration.account_worker.name, :password => @registration.account_worker.password}, status: :created
    else
      render json: @registration.errors, status: :unprocessable_entity
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:account_worker_id, :aws_id)
    end
end
