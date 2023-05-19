require_relative "tree_node.rb"
class KnightPathFinder
    

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
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

    




    # def dfs(target)
    #     return self if self.value == target
    #     self.children.each do |child|
    #         result = child.dfs(target)
    #         return result if result !=nil
    #     end
    #     return nil
    # end

end