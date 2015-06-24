class Question < ActiveRecord::Base
  has_many :responses

  validates :title,
    presence: true

  validates :description,
    presence: true

  validates_length_of :description,
    minimum: 150

    validates_length_of :title,
      minimum: 40
end
