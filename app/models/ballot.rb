class Ballot
  def self.cast(voter, votable, vote)
    if vote == 'up'
      voter.vote_exclusively_for(votable)
    elsif vote == 'down'
      voter.vote_exclusively_against(votable)
    end
  end
end
