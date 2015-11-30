class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_pic, ProfilePicUploader

  has_many :drill_completes, dependent: :nullify
  has_many :drills, through: :drill_completes

  has_many :user_badges, dependent: :nullify
  has_many :badges, through: :user_badges

  has_many :drill_groups, dependent: :nullify
  has_many :drills, dependent: :nullify

  has_many :user_drill_groups, dependent: :nullify
  has_many :drill_groups, through: :user_drill_groups


#### This isn't a good idea. Going through all records every time we want badges
#### or points will have terrible performance. Also users will lose badges if more
#### drills are added. I feel bad erasing all your hard work but
#### you should take a good look at what I did to solve these problems.
####
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

  # needs to be calculated in real time since more drills can be added.
  # this is the percentage score
  def get_drill_group_score(drill_group)
    drills_complete = 0
    drill_group.drills.each do |drill|
      if drill_completes.exists?(drill_id: drill)
        drills_complete += 1
      end
    end

    (drills_complete.to_f / drill_group.drills.count * 100).round(0)
  end



end
