class Event < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    as_many :attendances
    has_many :attendee, through: :attendances, source: :user
end
