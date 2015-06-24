class Response < ActiveRecord::Base
  belongs_to :question

  validates :description,
    presence: true

    validates_length_of :description,
      minimum: 50


  validates :question_id,
    presence: true,
    numericality: { only_integer: true }
end
