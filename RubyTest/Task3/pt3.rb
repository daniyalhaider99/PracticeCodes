# frozen_string_literal: true
require "byebug"
# class
class RandomPassword
  def initialize(alphasize, symsize, numsize)
    @alph = alphasize
    @sym = symsize
    @nums = numsize
    @password = ''
  end

  def addsymbol
    symbols = '$&()*+[]@#^-_!?%{}[]|:;/?.>,<'
    index = rand(0...symbols.length)
    @password += symbols[index]
  end

  def addnumber
    numbers = '0123456789'
    index = rand(0...numbers.length)
    @password += numbers[index]
  end

  def addsmall
    lowcase = 'abcdefghijklmnopqrstuvxyz'
    index = rand(0...lowcase.length)
    @password += lowcase[index]
  end

  def addcaps
    ucase = 'ABCDEFGHIJKLMNOPQRSTUVXYZ'
    index = rand(0...ucase.length)
    @password += ucase[index]
  end

  def random_password
    alpha = 0
    num = 0
    symb = 0
    while alpha < @alph || num < @nums || symb < @sym
      choose = rand(0...3)
      case choose
      when 0
        choice_between_cap_sma = rand(1..2)
        alpha += 1
        case choice_between_cap_sma
        when 1
          addcaps
        when 2
          addsmall
        end
      when 1
        num += 1
        addnumber
      when 2
        symb += 1
        addsymbol
      end
    end
    @password += "\n"
  end

  def print
    puts "Generated Password: #{@password}"
  end

  def storeinfile
    afile = File.open('Task3/passwords.csv', 'r')
    if afile
      content = afile.read
    else
      puts 'Unable to open file!'
    end

    byebug
    puts content
    if content.include?(@password)
      puts 'Password already present in file so not adding again'
    else
      afile = File.open('Task3/passwords.csv', 'w')
      content = content.to_s
      content.insert(0, @password)
      afile.write(content)
      puts 'Password Added in File Successfully'
      afile.close
    end
  end
end

# Main
puts 'Enter The Length of Combinations '
puts 'The Length of Each Input Should Be Greater Than 7'

print 'Alphabet '
alpha_size = gets.chomp.to_i
while alpha_size <= 7
  puts 'Enter Integer Greater Than 7'
  alpha_size = gets.chomp.to_i
end

print 'Numbers '
num_size = gets.chomp.to_i
while num_size <= 7
  puts 'Integer Greater Than 7'
  num_size = gets.chomp.to_i
end

print 'Symbols '
symb_size = gets.chomp.to_i
while symb_size <= 7
  puts 'Integer Greater Than 7'
  symb_size = gets.chomp.to_i
end

pass = RandomPassword.new(alpha_size, symb_size, num_size)
pass.random_password
pass.print
pass.storeinfile
