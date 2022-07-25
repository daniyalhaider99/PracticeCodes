# frozen_string_literal: true

# class
class RunningSum
  def initialize(size)
    @array = Array.new(size)
    @sumarray = Array.new(size, 0)
    (0...size).each do |i|
      @array[i] = rand(0..10)
    end
  end

  def running_sum
    sum = 0
    i = 0
    # USE EACH WITH INDEX METHOD
    @array.each do |num|
      if i.zero?
        sum = num
        @sumarray[i] = sum
        i += 1
      else
        sum += num
        @sumarray[i] = sum
        i += 1
      end
    end
  end

  def printarrays
    puts 'Original'
    @array.each do |num|
      print num, ' '
    end
    print "\n"
    puts 'Sum Array'
    @sumarray.each do |num|
      print num, ' '
    end
    print "\n"
  end
end

# Main

puts 'Enter a size of array'
size = gets.chomp.to_i

OriginalArray = RunningSum.new(size)
OriginalArray.running_sum
OriginalArray.printarrays
