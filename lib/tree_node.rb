class PolyTreeNode
    attr_reader :parent, :children , :value
    attr_writer :parent
    def initialize(value)
        @value = value
        @parent = nil
        @children = []

    end

    def parent=(node)   
        parent = node
        node.children << self

    end






    


  
end