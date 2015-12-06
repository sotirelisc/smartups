class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]
  
  def new
    @newsletter = Newsletter.new
  end
  
  def create
    @newsletter = Newsletter.new newsletter_params
    if verify_recaptcha(:model => @newsletter, :message => "is wrong", :attribute => "reCAPTCHA") && @newsletter.save
      redirect_to root_path, notice: 'Successfully subscribed!'
    else
      flash.delete(:recaptcha_error)
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:first_name, :last_name, :email)
    end
end