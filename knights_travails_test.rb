

class Square
  attr_accessor :value, :parent_node, :children

  def initialize(value, parent_node = nil, children = nil)
    @value = value
    @parent_node = parent_node
    @children = children
  end

end

class KnightMoves

  attr_reader :root, :visited
  attr_accessor :visited

  def initialize(root)
    @tree = []
    @root = Square.new(root)
    @tree << @root
    @visited = [root]

    build_tree(@root)
  end

  def build_tree(square)
    # puts square.inspect
    # puts @tree.inspect
    # puts build_moves(square).inspect
    putvisited
    # arr.each { |num| insert_node(@root, num) }
    # puts @tree.inspect
  end

  def putvisited
    puts @visited.inspect
    
  end

  # def build_moves(square)
  #   child_moves = []
  #   x = square.value[0]
  #   y = square.value[1]
  #   child_moves.push([x + 2, y + 1], [x + 1, y + 2], [x -1, y + 2], [x - 2, y + 1], 
  #                     [x - 2, y - 1], [x - 1, y -2], [x + 1, y - 2], [x + 2, y - 1])
  #   puts valid_move?(child_moves).inspect
  #   # @visited << child_moves
  #   puts "this is @visited: #{@visited.inspect}" 
  # end

  # def valid_move?(arr)
  #   valid_moves = []
  #   arr.each { |arr| 
  #     if arr[0].between?(1, 8) && arr[1].between?(1, 8)
  #       valid_moves << arr
  #     end
  #   }
  #   return valid_moves
  # end

  

end

def knight_moves(root, target)
  tree = KnightMoves.new(root)
end


puts knight_moves([1,1], [2,4])
