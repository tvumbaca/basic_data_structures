
class Node
  attr_accessor :value, :parent_node, :child_left, :child_right

  def initialize(value, parent_node = nil, child_left = nil, child_right = nil)
    @value = value
    @parent_node = parent_node
    @child_left = child_left
    @child_right = child_right
  end

end

class BinarySearchTree

  attr_reader :root

  def initialize(array)
    @tree = []
    @root = Node.new(array[0])
    @tree << @root
    build_tree(array[1..-1])
  end

  def build_tree(arr)
    arr.each { |num| insert_node(@root, num) }
    # puts @tree.inspect
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

  def depth_first_search(value)
    stack = [@root]
    visited = []
    until stack.empty?
      node = stack[-1]
      if node.value == value
        return "#{node} is equal to the value of #{value}."
      else
        if node.child_left.nil? || visited.include?(node.child_left)
          visited << stack.pop
          stack << node.child_right unless node.child_right.nil?
        else
          stack << node.child_left
        end
      end
    end
    nil
  end

  def dfs_rec(value, node = @root)
    return "#{node} is equal to the value of #{value}." if node.value == value
    left = dfs_rec(value, node.child_left) unless node.child_left.nil?
    return left if left  # returns left if left is true
    right = dfs_rec(value, node.child_right) unless node.child_right.nil?
    return right if right  # returns right if right is true
    nil
  end
  
end

arr = [5, 2, 4, 7, 8, 23]
bst = BinarySearchTree.new(arr)
# puts bst.breadth_first_search(2)
# puts bst.depth_first_search(23)
puts bst.dfs_rec(7)
