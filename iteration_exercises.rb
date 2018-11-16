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

end

def subwords(word, dictionary)

end

# load "iteration_exercises.rb"
a = [3, 2, 1]
a.bubble_sort!
b = [10, 2, 15, 3, 37, 2, 55, 9]
b.bubble_sort!
