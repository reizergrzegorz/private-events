class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    has_many :attendances
    has_many :attendees, through: :attendances, source: :user

    scope :upcoming, -> { where('date > ?', Time.now) }
    scope :past, -> { where('date < ?', Time.now) }
end
