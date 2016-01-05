class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_path}
        flash[:success] = "Thank you for sharing your thoughts with us. Your response has been recorded."
      else
        format.html { render :new }
      end
    end
  end
  
  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:full_name, :phone_number, :email, :message)
    end
end
