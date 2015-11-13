class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    ''' edited to allow for hashmaps as name/children '''
    if name.class == Hash
        children = name
        name = "_root"
    end
    if children.class == Hash
        @node_name = name
        @children = children.map {|k, v| Tree.new(k, v)}
    else
        @node_name = name
        @children = children
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

if true
    ruby_tree = Tree.new( "Ruby",
  [Tree.new("Reia"),
   Tree.new("MacRuby")] )

    puts "・Visiting a node"
    ruby_tree.visit {|node| puts node.node_name}
    puts

    puts "・Visiting entire tree"
    ruby_tree.visit_all {|node| puts node.node_name}
    puts
end

'''
The Tree class was interesting, but it did not allow you to specify a new tree
with a clean user interface. Let the initializer accept a nested structure with
hashes and arrays. You should be able to specify a tree like this:
'''
source = {"grandpa" => { "dad" => {"child 1" => {}, "child 2" => {} },
                    "uncle" => {"child 3" => {}, "child 4" => {} } } }

puts "・Visit my family"
Tree.new(source).visit_all {|node| puts node.node_name}
puts
