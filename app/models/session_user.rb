# A user to override the default behavior of `acts_as_voter` so that only
# a SessionUser can vote on an idea more than once.
#
class SessionUser < SimpleDelegator
  def initialize(session)
    @session = session
    @session[:votables] ||= {}

    @user ||= User.find_or_create_by_email(
      :email => 'session@reinventtransit.com',
      :password => 'asdflkjasdfljkas;dlfkja;sldkjf',
      :password_confirmation => 'asdflkjasdfljkas;dlfkja;sldkjf'
    )

    __setobj__(@user)
  end

  def vote_exclusively_for(votable)
    remove_old_votes(votable)
    if can_vote?(votable.id)
      @session[:votables][votable.id] = true
      @user.vote_for(votable)
    end
  end

  def vote_exclusively_against(votable)
    remove_old_votes(votable)
    if can_vote?(votable.id)
      @session[:votables][votable.id] = false
      @user.vote_against(votable)
    end
  end

  private
  def can_vote?(votable_id)
    !@session[:votables].keys.include?(votable_id)
  end

  def remove_old_votes(votable)
    vote = Vote.first(:conditions => {
      :voter_id => @user.id,
      :voter_type => @user.class.base_class.name,
      :voteable_id => votable.id,
      :voteable_type => votable.class.base_class.name,
      :vote => @session[:votables][votable.id]
    })

    @session[:votables].delete(votable.id) if vote
    vote.destroy if vote
  end
end
