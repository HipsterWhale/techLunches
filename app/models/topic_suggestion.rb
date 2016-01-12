class TopicSuggestion < ActiveRecord::Base

  has_many :likes
  has_many :users, through: :likes

  validates_presence_of :name, message: 'Merci d\'entrer un nom à votre suggestion.'

end
