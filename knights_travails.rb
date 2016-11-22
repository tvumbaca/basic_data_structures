# build tree using the starting square as the root node
  # make method #find_moves that builds the moves, validates each move with #valid?, 
  # all valid moves become child nodes to the parent node
  #   Put child nodes into @children array

  #   return the target square path if it finds a match
  #   otherwise put all the valid moves into a Q and run #find_moves on .each of them.
  #   need to put any node that has been run by #find_moves into a visited array so we dont check them again.

# build a tree of moves
# take the root position and build only the valid child positions
#  only save those positions as square instances (maybe in an array together in @children)
# check to see if any have the value of the target position (this could stop the tree building)



class Square
  attr_accessor :value, :parent_node, :children

  def initialize(value, parent_node = nil)
    @value = value
    @parent_node = parent_node
    @children = []
  end

end

class KnightMoves

  attr_reader :root
  attr_accessor :visited

  def initialize(root, target)
    @tree = []
    @target = target
    @root = Square.new(root)
    @tree << @root
    @visited = [root]

    build_tree(@root) # needed to put this method call after @visited so @visited gets initialized first.
  end

  def build_tree(square)
    puts square.inspect
    
    puts build_moves(square).inspect
    puts @tree.inspect
    # arr.each { |num| insert_node(@root, num) }
    # puts @tree.inspect
  end

  def build_moves(square)
    child_moves = []
    x = square.value[0]
    y = square.value[1]
    child_moves.push([x + 2, y + 1], [x + 1, y + 2], [x -1, y + 2], [x - 2, y + 1], 
                      [x - 2, y - 1], [x - 1, y -2], [x + 1, y - 2], [x + 2, y - 1])
    
    # takes array of valid child moves and puts each of them into @visited
    valid_move?(child_moves).each { |move| 
      @visited << move
      child = Square.new(move, square)
      square.children << child
    }
     puts "this is @visited: #{@visited.inspect}"
     puts "this is @children: #{square.inspect}"
  end

  def valid_move?(arr)
    valid_moves = []
    arr.each { |arr| 
      if arr[0].between?(1, 8) && arr[1].between?(1, 8)
        valid_moves << arr
      end
    }
    return valid_moves
  end

  def insert_node(node, num)
    if num < node.value
      node.child_left.nil? ? node.child_left = Node.new(num, node) : insert_node(node.child_left, num)
    elsif num > node.value
      node.child_right.nil? ? node.child_right = Node.new(num, node) : insert_node(node.child_right, num)
    end
  end

  def breadth_first_search(value)
    q = [@root]
    until q.empty?
      node = q.shift
      if node.value == value
        return "#{node} is equal to the value of #{value}."
      else
        q << node.child_left unless node.child_left.nil?
        q << node.child_right unless node.child_right.nil?
      end
    end
    nil
  end

end

def knight_moves(root, target)
  tree = KnightMoves.new(root, target)
  # puts tree.inspect
end


puts knight_moves([1,1], [2,4])



#arr = [5, 2, 4, 7, 8, 23]
# bst = BinarySearchTree.new(arr)
# puts bst.breadth_first_search(2)
# puts bst.depth_first_search(23)
# puts bst.dfs_rec(7)

# def depth_first_search(value)
#     stack = [@root]
#     visited = []
#     until stack.empty?
#       node = stack[-1]
#       if node.value == value
#         return "#{node} is equal to the value of #{value}."
#       else
#         if node.child_left.nil? || visited.include?(node.child_left)
#           visited << stack.pop
#           stack << node.child_right unless node.child_right.nil?
#         else
#           stack << node.child_left
#         end
#       end
#     end
#     nil
#   end

#   def dfs_rec(value, node = @root)
#     return "#{node} is equal to the value of #{value}." if node.value == value
#     left = dfs_rec(value, node.child_left) unless node.child_left.nil?
#     return left if left  # returns left if left is true
#     right = dfs_rec(value, node.child_right) unless node.child_right.nil?
#     return right if right  # returns right if right is true
#     nil
#   end
