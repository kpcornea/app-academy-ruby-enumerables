require "byebug"

class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      ele = self[i]
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
    byebug
    self.my_each do |ele|
      if ele.is_a?(Array)
        new_arr += ele
      else
        new_arr << ele
      end
    end
    byebug
    return new_arr if new_arr.flattened?
    new_arr.my_flatten
  end

  def flattened?
    self.my_each do |ele|
      return false if ele.is_a?(Array)
    end
    true
  end

end

# b = [1, 2, [3, 4]]
# p a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

 [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten
