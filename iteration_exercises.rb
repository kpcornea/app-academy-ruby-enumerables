def factors(num)
  (1..num).select { |i| num % i == 0 }
end

class Array
  def bubble_sort!(&prc)
    sorted = true
    i = 0

    while true
      sorted = true if i == 0

      if prc.nil?
        if self[i] > self[i + 1]
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      else
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end

      i += 1
      break if i == self.length - 1 && sorted == true
      i = 0 if i == self.length - 1
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

end


def substrings(str)
  new_arr = []

  str.each_char.with_index do |char1, i|
    sub_str = char1
    new_arr << sub_str

    str.each_char.with_index do |char2, j|
      if j > i
        sub_str += char2
        new_arr << sub_str
      end
    end
  end

  new_arr
end

def subwords(word, dictionary)
  substrings(word).select { |ele| dictionary.include?(ele) }
end
