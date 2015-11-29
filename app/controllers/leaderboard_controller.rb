class LeaderboardController < ApplicationController

  def leaderboard
    @users = User.all.sort_by {|user| user.points}
  end

end
