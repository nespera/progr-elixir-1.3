# This is a function that returns a function to append the given
# string to the one passed
prefix = fn
  (a) -> fn
    (b) -> "#{a} #{b}"
   end
end