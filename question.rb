# Given an expression string, write a program to examine whether 
# the pairs and the orders of “(“, “)” are correct
# ()())() = false
# ) = false
# ()(()) = true
# ()())()( = false

def processString(str)
    counter = 0
    str.split("").each { |c|
      if counter == 0 && c == ")"
        return false
      else
        counter += 1 if c == "("
        counter -= 1 if c == ")"
      end
    }
    return counter == 0
end

# {[]}
def procStr(str)
    pairs = {
        "[": "]",
        "{": "}",
        "(": ")"
    }

    stack = []
    puts stack
    str.gsub(/[a-zA-Z]/, "").split("").each { |c|
        if pairs.keys.include?(c.to_sym)
            stack.push(c)
            puts stack
        else
            if c != pairs[(stack.last || "").to_sym]
                return false
            else
                stack.pop
            end
        end
    }
    puts stack
    return stack.empty?
end