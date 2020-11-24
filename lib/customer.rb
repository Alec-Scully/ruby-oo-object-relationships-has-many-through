require 'pry'

class Customer
    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age

        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        new_meal = Meal.new(waiter, self, total, tip)
    end

    def meals
        my_meals = Meal.all.select do | meals |
            meals.customer == self
        end
        my_meals
    end

    def waiters
        my_waiters = self.meals.map do | my_meals |
            my_meals.waiter
        end
        my_waiters
    end
end