class ContactsController < ApplicationController
    def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path(anchor: 'contact'), notice: 'Your message has been sent. I’ll get back within 1-2 days.'
      # render :js => 'confirmSend()'
  # redirect_to root_path, notice: 'Message sent successfully'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end
end
