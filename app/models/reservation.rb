class Reservation < ActiveRecord::Base

  belongs_to :user
  belongs_to :conference

  validates :user_id, uniqueness: { scope: [:user_id, :conference_id], message: 'Vous participez déjà à cette conférence.' }
  validate :conference_still_have_sits

  def conference_still_have_sits
    if conference.taken_sits + 1 > conference.sits
      errors.add :conference, 'Plus aucune place n\'est disponible pour cette conférence.'
    end
  end

end
