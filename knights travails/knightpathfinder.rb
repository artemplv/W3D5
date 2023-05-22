require_relative "tree_node.rb"

class KnightPathFinder
    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        self.build_move_tree
    end

    def inspect
        "id: #{self.object_id}, root_node: { #{self.root_node} }"
    end

    def self.valid_moves(pos)
        i,j = pos
        result = []
        [i+1,i-1].each do |x|
            [j+2,j-2].each do |y| 
                result << [x,y] if x < 8 && x >= 0 && y < 8 && y >= 0
            end
        end
        [i+2,i-2].each do |x|
            [j+1,j-1].each do |y| 
                result << [x,y] if x < 8 && x >= 0 && y < 8 && y >= 0
            end
        end
        result
    end

    def new_move_positions(pos)
        res = KnightPathFinder.valid_moves(pos).select { |x| !@considered_positions.include?(x) }
        @considered_positions = @considered_positions.concat(res)
        res
    end

    def build_move_tree
        queue = [@root_node]
        while !queue.empty?
            node = queue.shift
            positions = new_move_positions(node.value)
            positions.each do |p| 
                new_node= PolyTreeNode.new(p)
                node.add_child(new_node)
                queue << new_node
            end
        end
    end

    def find_path(target_val)
        node = @root_node.dfs(target_val)
        return nil if !node
        trace_path_back(node)
    end

    def trace_path_back(node)
        res = [node.value]

        while node.parent != nil
            res.unshift(node.parent.value)
            node = node.parent
        end

        res
    end
end