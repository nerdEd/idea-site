class PagesController < ApplicationController
  def home; end

  def apis; end

  def schedule; end

  def sponsor; end

  def contact
    @contact = Contact.new
  end
end
