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



  def full_name
    "#{first_name} #{last_name}"
  end

  # needs to be calculated in real time since more drills can be added.
  # this is the percentage score
  def get_drill_group_score(drill_group)
    return 100 if drill_group.drills.count == 0

    drills_complete = 0
    drill_group.drills.each do |drill|
      if drill_completes.exists?(drill_id: drill)
        drills_complete += 1
      end
    end
    (drills_complete.to_f / drill_group.drills.count * 100).round(0)
  end



end
