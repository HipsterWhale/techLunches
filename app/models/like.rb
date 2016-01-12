class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :topic_suggestion
  validates :user_id, uniqueness: { scope: [:user_id, :topic_suggestion_id], message: 'Vous avez déjà aimé cette suggestion.' }

end
