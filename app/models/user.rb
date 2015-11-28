class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :drill_records
  has_many :drills, through: :drill_records

# not tested yet, will be tested when seed file ready, then correct
  def badges
    badges = Array.new
    drill_groups = drills.each.map{|drill| drill.drill_group}.uniq
    drill_groups.each do
      if (finished?(drill_group))
        badges.push drill_group.badges
      end
    end
    badges
  end


# not tested yet, will be tested when seed file ready, then correct
  def finished? drill_group
    drill_group.drills.each do |drill|
      if user.drills.include? drill
      else
        return false
      end
    end
    true
  end

end
