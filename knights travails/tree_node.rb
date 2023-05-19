class PolyTreeNode
    attr_reader :parent, :children , :value
    # attr_writer :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        parent.children.delete(self) if parent
    
        @parent = node
        @parent.children << self if @parent != nil
    end

    def add_child(child)
        child.parent=(self) 
    end

    def remove_child(child)
        raise"child is not a child of self" if !children.include?(child)
        child.parent=(nil) 
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            result = child.dfs(target)
            return result if result !=nil
        end
        return nil
    end

    def bfs(target)
        queue = [self]

        while !queue.empty?
            node = queue.shift
            return node if node.value == target
            queue.concat(node.children)
        end
    end










    


  
end