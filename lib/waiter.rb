class Waiter
    attr_accessor :name, :years_experience

    @@all = []

    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience

        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        new_meal = Meal.new(self, customer, total, tip)
    end

    def meals
        waiter_meals = Meal.all.select do | meals |
            meals.waiter == self
        end
    end

    def best_tipper
        best_tip = 0
        best_tipper = nil
        meals.select do | meals|
            if meals.tip > best_tip
                best_tipper = meals.customer
                best_tip = meals.tip
            end
            # binding.pry
        end
        best_tipper
    end
end