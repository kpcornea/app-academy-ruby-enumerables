require "byebug"

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      ele = self[i]
      byebug
      prc.call(ele)
      i += 1
    end
    self
  end

  def my_select(&prc)
    new_arr = []
    self.my_each do |ele|
      new_arr << ele if prc.call(ele)
    end
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each do |ele|
      new_arr << ele if !prc.call(ele)
    end
    new_arr
  end

  def my_any?(&prc)
    self.my_each do |ele|
      return true if prc.call(ele)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |ele|
      return false if !prc.call(ele)
    end
    true
  end

  def my_flatten
    new_arr = []

    self.my_each do |ele|
      if ele.is_a?(Array)
        new_arr += ele
      else
        new_arr << ele
      end
    end

    return new_arr if new_arr.flattened?
    new_arr.my_flatten
  end

  def flattened?
    self.my_each do |ele|
      return false if ele.is_a?(Array)
    end
    true
  end

  def my_zip(*args)
    new_arr = []

    self.each_with_index do |ele, i|
      sub_arr = [ele]

      j = 0
      while j < args.length
        sub_arr << args[j][i]
        j += 1
      end

      new_arr << sub_arr
    end

    new_arr
  end

  def my_rotate(n=1)
    new_arr = self.dup

    if n > 0
      (0...n).each { new_arr << new_arr.shift }
    else
      (0...n.abs).each { new_arr.unshift(new_arr.pop) }
    end

    new_arr
  end

  def my_join(sep="")
    str = ""

    self.each_with_index do |ele, i|
      if i == self.length - 1
        str += ele
      else
        str += ele + sep
      end
    end

    str
  end

  def my_reverse
    new_arr = []
    (self.length - 1).downto(0) { |i| new_arr << self[i] }
    new_arr
  end


end

# b = [1, 2, [3, 4]]
# p a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

 # [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten
 # a = [ 4, 5, 6 ]
 #  b = [ 7, 8, 9 ]
 #  [1, 2, 3].my_zip(a, b)
