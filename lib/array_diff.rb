require 'diffy'

class ArrayDiff
  def initialize(old_array, new_array)
    @old_array = old_array
    @new_array = new_array
  end

  def additions
    @new_array - @old_array
  end

  def removals
    @old_array - @new_array
  end

  def pretty_print
    diff = Diffy::Diff.new(
      list(@old_array),
      list(@new_array),
    )
    diff.to_s(:color)
  end

  private

  def list(array)
    array.join("\n") + "\n"
  end
end
