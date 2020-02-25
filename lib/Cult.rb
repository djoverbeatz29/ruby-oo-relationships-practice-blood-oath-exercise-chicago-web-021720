class Cult

    # extend ClassMethods

    attr_accessor :location, :slogan, :min_age
    attr_reader :name, :founding_year

    @@all = []

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.find { |c| c.name == name }
    end

    def self.find_by_location(location)
        @@all.find_all { |c| c.location == location}
    end

    def self.find_by_founding_year(year)
        @@all.find_all { |c| c.founding_year == year}
    end

    def self.least_popular
        @@all.min_by { |c| c.cult_population }
    end

    def most_common_location
        all_locs = @@all.map { |c| c.location }.uniq.max_by { |loc| loc.find_by_location.length }
    end

    def initialize(name:, location:, founding_year:, slogan:, min_age: 10)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @min_age = min_age
        @@all << self
    end

    def recruit_follower(new_follower)
        if new_follower.age >= self.min_age
            BloodOath.new(follower: new_follower, cult: self, date: "1969-07-01")
            puts "Welcome aboard, #{new_follower.name}!"
        else
            puts "We're sorry, Dear #{new_follower.name}, but you ain't old enough... yet! Until soon!"
        end
    end

    def find_followers
        BloodOath.all.find_all { |bo| bo.cult == self }.map { |bo| bo.follower }
    end
    
    def cult_population
        self.find_followers.length
    end

    def average_age
        ages = self.find_followers.map { |mem| mem.age }
        1.0 * ages.sum / ages.length
    end

    def my_followers_mottos
        self.find_followers.map { |mem| mem.life_motto }
    end

end