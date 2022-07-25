# frozen_string_literal: true

require 'byebug'
# Class declaration
class FrequencyArray
  def initialize(size)
    @usedsize = 0
    @usedsize1 = 0
    @array = Array.new(size)
    @freqarray = Array.new(size)
    @distinctarray = Array.new(size)
  end

  def random_array
    (0...@array.length).each do |i|
      @array[i] = rand(0..10)
    end
  end

  def create_hash
    @array.each do |num|
      stats = @distinctarray.include?(num)
      next if stats == true

      distinctarray[@usedsize] = num
      @usedsize += 1
    end

    count = 0
    @distinctarray.each do |i|
      count = 0
      @array.each do |j|
        count += 1 if i.eql?(j)
      end
      @freqarray[@usedsize1] = count
      @usedsize1 += 1
    end
    @distinctarray = @distinctarray.slice(0,@usedsize - 1)
    @freqarray = @freqarray.slice(0, @usedsize - 1)
  end

  def print
    puts 'Original: ', @array.to_s

    puts 'Hash'
    puts 'Values: ', @distinctarray.to_s
    puts 'Frequency: ', @freqarray.to_s
  end
end

# Main
puts 'Enter a size of array'
size = gets.chomp.to_i
array = FrequencyArray.new(size)
array.random_array
array.create_hash
array.print
