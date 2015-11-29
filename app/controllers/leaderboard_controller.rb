class LeaderboardController < ApplicationController

  def leaderboard
    @users = User.order(points: :desc)     #.all.sort_by {|user| user.points} <- this has bad performance
  end

end
