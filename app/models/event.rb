class Event < ApplicationRecord
    has_many :attendances
    has_many :paticipants
    belongs_to :user

    validates :start_date, presence: true, if :future_event
    validates :duration, presence: true, greater_than: :0, numericality: { only_integer: true }, if: :modulo5
    validates :title, prensence: true, length: { in: 5..140 }
    validates :description, prensence: true, length: { in: 20..1000 }
    validates :price, prensence: true, length: { in: 1..1000 }
    validates :location, prensence: true
    
    def future_event
        start_date => Date.today
    end

    def modulo5
        duration/5==Integer
      end

end
