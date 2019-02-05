require 'pry'

class Zoo
  attr_reader :cages, :employees, :animals

  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    create_cages
    @employees = []
  end

  def create_cages
    10.times { |i| @cages.push(Cage.new()) }
  end

  def add_employee(employee)
    @employees.push(employee)
  end

  def add_animal(animal)
    empty_cage = @cages.select{|cage| cage.empty?}[0]
    full_house = "Your zoo is already at capacity!"
    empty_cage ? empty_cage.animal = animal : full_house ;
  end

  def open?(date)
    date > @season_opening_date && date < @season_closing_date
  end

  def visit
    @employees.map { |e| e.greet }.join("\n ") + "\n" +
    @cages.select{ |c| !c.empty? }.map { |c| c.animal.speak }.join("\n") + "\n"
  end
end
