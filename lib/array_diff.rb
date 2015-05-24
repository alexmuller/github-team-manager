require 'colorize'

class ArrayDiff
  def initialize(old_array, new_array)
    @old_array = old_array
    @new_array = new_array
    @union = @old_array | @new_array
    @union.sort_by! { |elem| elem.downcase }
  end

  def additions
    @new_array - @old_array
  end

  def removals
    @old_array - @new_array
  end

  def pretty_print
    @union.map do |elem|
      if additions.include? elem
        elem = "+ #{elem}".colorize(:green)
      elsif removals.include? elem
        elem = "- #{elem}".colorize(:red)
      else
        elem = "  #{elem}"
      end
    end
  end
end
