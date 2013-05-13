class RemoveVotingConstraints < ActiveRecord::Migration
  def up
    remove_index 'votes', :name => "fk_one_vote_per_user_per_entity"
  end

  def down
    add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  end
end
