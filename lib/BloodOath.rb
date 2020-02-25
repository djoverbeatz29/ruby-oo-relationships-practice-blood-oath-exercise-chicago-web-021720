require 'date'

class BloodOath

    # extend ClassMethods

    attr_reader :initiation_date, :follower, :cult

    @@all = []

    def self.all
        @@all
    end

    def self.first_oath
        @@all.min_by { |bo| bo.initiation_date }
    end

    def initialize(follower:, cult:, date:)
        @follower = follower
        @cult = cult
        @initiation_date = date
        @@all << self
    end

end