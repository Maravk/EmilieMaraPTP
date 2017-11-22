class Tree
  attr_accessor :node_name, :children

  def initialize(arr)
    arr = arr.to_a unless arr.is_a?(Array)
    arr.flatten!
    @node_name = arr.first
    @children = []
    arr.last.each { |c| @children << Tree.new(c) }
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all(&block) }
  end
end

family_tree = Tree.new({'Auto' => { 'Motor' => { 'Schläuche' => {}, 'Kolben' => {}},
  'Karosserie' => {'Metall' => {}, 'Kotflügel' => {}} } })

family_tree.visit_all { |node| p node.node_name }

#
#identity = Hash.new { |hash, key| hash[key] = key }
#value = identity[:a]
#value # => :a
#value.object_id # => 362728
#identity[:a].object_id # => 362728
#  
#  
#tree = Hash.new { |hash, key| hash[key] = {} }
#tree[:a] #=> {}
#tree[:a][:x] = 'Foo'
#tree[:a][:y] = 'Bar'
#tree[:b][:x] = 'Baz'
#tree[:b][:y] = 'Qux'
##tree # => {
##  :a => {:x => 'Foo',
##    :y => 'Bar' }
##  :b => {
##    :x => 'Baz',
##    :y => 'Qux'
##  }
##}
#
#teams[:hockey][:western][:pacific] = ["sharks", "oilers"]
#teams[:hockey][:western][:central] = ["blues", "stars"]
#teams[:hockey][:eastern][:metropolitan] = ["penguins", "flyers"]
#teams[:hockey][:eastern][:atlantic] = ["redwings", "bruins"]
#
#teams # => {
#  :hockey => {
#    :western => {
#      :pacific => [
#        [0] "sharks",
#        [1] "oilers"
#      ],
#      :central => [
#        [0] "blues",
#        [1] "stars"
#      ]
#    },
#    :eastern => {
#      :metropolitan => [
#        [0] "penguins",
#        [1] "flyers"
#      ],
#      :atlantic => [
#        [0] "redwings",
#        [1] "bruins"
#      ]
#    }
#  }
#}