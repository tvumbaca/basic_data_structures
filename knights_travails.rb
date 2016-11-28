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
    build_tree([@root]) # needed to put this method call after @visited so @visited gets initialized first.
                        # needed to keep this argument in array form in order to use .each in the #build_moves method.
  end

  def build_tree(square_arr)
    build_moves(square_arr)
  end

  def build_moves(square_arr)
    square_arr.each { |square| 
      child_moves = []
      x = square.value[0]
      y = square.value[1]
      child_moves.push([x + 2, y + 1], [x + 1, y + 2], [x -1, y + 2], [x - 2, y + 1], 
                        [x - 2, y - 1], [x - 1, y -2], [x + 1, y - 2], [x + 2, y - 1])
      # each square value goes into @visited so we dont re-visit them again
      @visited << square.value
      valid_move?(child_moves).each { |move| 
        # each valid child move goes into moves array to see if the target is matched later 
        moves = [] 
        moves << move
        child = Square.new(move, square)
        square.children << child
        moves.include?(@target) ? return : build_moves(square.children)
      }
    }
  end

  def valid_move?(child_moves)
    valid_moves = []
    child_moves.each { |arr| 
      if arr[0].between?(1, 8) && arr[1].between?(1, 8) && !@visited.include?(arr)
        valid_moves << arr
      end
    }
    return valid_moves
  end

  def breadth_first_search(value)
    q = [@root]
    until q.empty?
      node = q.shift
      if node.value == value
        return find_path(node)
      else
        node.children.each { |child| 
          q << child
        }
      end
    end
  end

  def find_path(node)
    path = []
    path_node = node
    until path_node.parent_node.nil?
      path << path_node.value
      path_node = path_node.parent_node
    end
    path = (path << @root.value).reverse
    puts "You made it in #{path.length} moves!!"
    puts "Your path is:"
    path.each { |move| puts move.inspect }
  end

end

def knight_moves(root, target)
  tree = KnightMoves.new(root, target)
  tree.breadth_first_search(target)
end

knight_moves([1,1], [4,7])
