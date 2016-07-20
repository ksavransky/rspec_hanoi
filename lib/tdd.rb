require "byebug"
class Array
  def my_uniq
    result = []
    self.each do |elem|
      result << elem unless result.include?(elem)
    end

    result
  end

  def two_sum
    index_pairs = []
    (0...self.length - 1).each do |i|
      ((i + 1)...self.length).each do |j|
        index_pairs << [i, j] if (self[i] + self[j]).zero?
      end
    end

    index_pairs
  end

  def my_transpose
    result = Array.new(self.length) { Array.new }
    self.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        result[col_idx][row_idx] = el
      end
    end

    result
  end
end

class StockPicker
  def initialize(array_of_prices)
    @array_of_prices = array_of_prices
  end

  def pick_stock
    best_pair = nil

    (0...(@array_of_prices.length - 1)).each do |i|
      ((i + 1)...@array_of_prices.length).each do |j|
        best_pair = [i, j] if best_pair.nil?
        if @array_of_prices[j] - @array_of_prices[i] > @array_of_prices[best_pair[1]] - @array_of_prices[best_pair[0]]
          best_pair = [i, j]
        end
      end
    end

    best_pair
  end
end

class Towers
  attr_reader :towers

  def initialize(towers = [[3, 2, 1], [], []])
    @towers = towers
  end

  def play
    until won?
      p @towers
      start_tower = get_start_tower
      end_tower = get_end_tower

      move(start_tower, end_tower)
    end

    puts "YOU WIN WOW U ARE AMAZING!"
  end

  def move(start_tower, end_tower)
    raise ArgumentError unless [start_tower, end_tower].all? do |tower|
      tower.is_a?(Fixnum) && tower.between?(0, 2)
    end

    if @towers[end_tower].empty? || @towers[start_tower].last < @towers[end_tower].last
      @towers[end_tower].push(@towers[start_tower].pop)
    else
      raise "invalid move!"
    end

  end

  def won?
    @towers[0].empty? && (@towers[1].empty? || @towers[2].empty?)
  end

  def get_start_tower
    print "choose a starting tower (between 0 and 2) >  "
    gets.chomp.to_i
  end

  def get_end_tower
    print "choose an starting tower (between 0 and 2) >  "
    gets.chomp.to_i
  end
end
t = Towers.new
t.play
