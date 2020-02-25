require 'time'

class Follower

    # extend ClassMethods

    attr_accessor :name, :age, :life_motto, :cults

    @@all = []

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        @@all.find_all { |f| f.age >= age }
    end

    def self.most_active
        @@all.max_by { |fo| fo.cults.length }
    end

    def self.top_n(n = 10)
        @@all.sort_by { |fo| fo.cults.length }.reverse.slice(0, n)
    end

    def initialize(name:, age:, life_motto:)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def join_cult(new_cult)
        if self.age >= new_cult.min_age
            BloodOath.new(follower: self, cult: new_cult, date: Date.today.strftime)
        else
            puts "We're sorry, Dear #{self.name}, but you ain't old enough... yet! Until soon!"
        end
    end

    def cults
        BloodOath.all.find_all { |bo| bo.follower == self }.map { |bo| bo.cult}
    end

    def my_cults_slogans
        self.cults.map { |c| c.slogan }
    end

    def fellow_cult_members
        @@all.find_all { |fo| !!(fo.cults || self.cults) && fo != self }
    end

end