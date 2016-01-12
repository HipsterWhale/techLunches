class User < ActiveRecord::Base

  has_secure_password

  has_many :likes
  has_many :topic_suggestions, through: :likes
  has_many :reservations
  has_many :conferences, through: :reservations

  validates_uniqueness_of :booster_id,
    message: 'Vous êtes déjà inscrit sur la plateforme. Si vous avez oublié votre mot de passe, contactez un responsable tech\'Lunches sur votre campus.'
  validates_presence_of :first_name, message: 'Merci d\'entrer votre prénom.'
  validates_presence_of :last_name, message: 'Merci d\'entrer votre nom.'

end
