class Node
    attr_accessor :nextNode, :value

    def initialize(value = nil, nextNode = nil)
        @value = value
        @nextNode = nextNode
    end
end

class LinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def append(value)
        if (@head.nil?)
            @head = Node.new(value, nil)
        else
            lastNode = @head

            until(lastNode.nextNode.nil?)
                lastNode = lastNode.nextNode
            end

            lastNode.nextNode = Node.new(value, nil)
        end
    end

    def prepend(value)
        if (@head.nil?)
            @head = Node.new(value, nil)
        else
            firstNode = @head
            @head = Node.new(value, firstNode)
        end
    end

    def size()
        count = 0
        currentNode = @head

        # while (currentNode) works aswell, I just believe this is more readable
        until (currentNode.nil?)
            currentNode = currentNode.nextNode
            count += 1
        end
        return count
    end

    def head
        return @head.value
    end

    def tail
        currentNode = @head

        # This requires it to loop through the entire list I need to refactor code to have the tail a set variable
        while (currentNode)
            currentNode = currentNode.nextNode
            if (currentNode.nextNode.nil?)
                return currentNode.value
            end
        end
    end

    def at(index)
        currentNode = @head
        num = 0

        while num < index
            num += 1
            currentNode = currentNode.nextNode
        end
        return currentNode.value
    end

    def pop
        currentNode = @head
       
        while (currentNode)
            currentNode = currentNode.nextNode

            if (currentNode.nextNode.nextNode.nil?)
                return currentNode.nextNode = nil
            end
        end
    end

    def contains?(value)
        currentNode = @head

        while (currentNode)
            return true if currentNode.value == value
            currentNode = currentNode.nextNode
        end

        return false
    end

    def find(value)
        currentNode = @head
        index = 0

        while (currentNode)
            return index if currentNode.value == value

            currentNode = currentNode.nextNode
            index += 1
        end
        return "NOT FOUND!"
    end

    def to_s
        currentNode = @head

        while (currentNode)
            print "(#{currentNode.value}) -> "
            currentNode = currentNode.nextNode
        end

        "NIL"
    end

end

ll = LinkedList.new

ll.append(20)
ll.append(10)
ll.append(15)
ll.prepend(200)
ll.append(300)
ll.prepend(23)
ll.prepend(12)
# 12, 23, 200, 20, 10, 15, 300
ll.pop
# 12, 23, 200, 20, 10, 15
ll.append(2000000)
# 12, 23, 200, 20, 10, 15, 2000000

puts "Head:                 #{ll.head}"
puts "Size:                 #{ll.size}"
puts "Tail:                 #{ll.tail}"
puts "Element at index 5:   #{ll.at(5)}"
puts "List contains 2:      #{ll.contains?(2)}"
ll.prepend(2)
# 2, 12, 23, 200, 20, 10, 15, 2000000

puts "Now contains 2:       #{ll.contains?(2)}"
puts "Find index of  15:    #{ll.find(15)}"
puts "Find index of  3:     #{ll.find(3)}"
print "Full List:            "
puts "#{ll.to_s}"