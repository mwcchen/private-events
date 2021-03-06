class Event < ApplicationRecord
  has_many :attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: "User"

  scope :past, -> { where("date < :now", { now: Date.today }) }
  scope :upcoming, -> { where("date > :now", { now: Date.today }) }

  # def self.past
  #   return Event.where("date < :now", { now: Date.today })
  # end
  #
  # def self.upcoming
  #   return Event.where("date > :now", { now: Date.today })
  # end

end
