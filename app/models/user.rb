class User < ApplicationRecord
    has_many :attendandes
    has_many :events
end
