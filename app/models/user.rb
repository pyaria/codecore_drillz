class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  has_many :drill_completes, dependent: :nullify
  has_many :drills, through: :drill_completes

  has_many :user_badges, dependent: :nullify
  has_many :badges, through: :user_badges

#### The fuck is all this shit?????
# # not tested yet, will be tested when seed file ready, then correct
#   def badges
#     badges = Array.new
#     drill_groups = drills.each.map{|drill| drill.drill_group}.uniq
#     drill_groups.each do |drill_group|
#       if (finished?(drill_group))
#         badges.push drill_group.badges
#       end
#     end
#     badges
#   end
#
#
# # not tested yet, will be tested when seed file ready, then correct
#   def finished? drill_group
#     drill_group.drills.each do |drill|
#       if drills.include? drill
#       else
#         return false
#       end
#     end
#     true
#   end
#
# # not tested yet, will be tested when seed file ready
#   def points
#     if drills.any?
#       return drills.inject{|sum,drill| sum + drill.points}
#     else
#       return 0
#     end
#   end

  def full_name
    "#{first_name} #{last_name}"
  end


end
