class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      @contact.mail
      flash.notice = "Sent"
      redirect_to contacts_url
    else
      render :new
    end
  end
end
