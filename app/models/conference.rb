class Conference < ActiveRecord::Base

  has_many :reservations
  has_many :users, through: :reservations

  def taken_sits
    users.count
  end

  def free_sits
    sits - taken_sits
  end

end
