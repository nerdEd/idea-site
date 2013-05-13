class NewsletterController < ApplicationController
  def subscribe
    subscription = Subscription.new(params[:subscription])
    if subscription.valid?
      subscription.subscribe
      flash.notice = 'You are subscribed!'
    else
      flash.alert = 'You could not be subscribed, please try again.'
    end
    redirect_to root_url
  end
end
