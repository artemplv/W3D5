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






    


  
end