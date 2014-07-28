class Node
  
  attr_accessor :left
  attr_accessor :right
  attr_accessor :data
  attr_accessor :label
  attr_accessor :left_lab
  attr_accessor :right_lab
  
  
  def initialize x, text
   @left = nil
   @right = nil
   @data = x
   @label = text
  end
  
  
  
end

class Tree

  attr_accessor :nodes
  attr_accessor :root_node

  def initialize
   @nodes = []   
   @root_node = nil
  end
  def insert(n, start_node)
    if start_node.nil?
      @root_node = n
    else
      current_guy = start_node # istnieje na pewno!
      label = current_guy.label
      left_lab = "-"
      right_lab = "."
      
      
      if(label == left_lab) 
        if(current_guy.left.nil?)
          current_guy.left = n    
        else 
          left_son = current_guy.left
          self.insert(n, left_son) 
        end   
        
       else 
        if(current_guy.right.nil?)
          current_guy.right = n
        else
          right_son = current_guy.right
          self.insert(n, right_son)
        end
      else if(label == right_lab) 
          if(current_guy.right.nil?)
            current_guy.right = n    
          else 
            right_son = current_guy.right
            self.insert(n, right_son) 
          end   
        
         else 
          if(current_guy.left.nil?)
            current_guy.left = n
          else
            left_son = current_guy.left
            self.insert(n, left_son)
          end
      end
    end
      
      
       @nodes << n
    end
    
    def dfs(head)
      queue = Queue.new
      queue = []
      queue<<(head)
      while not queue.empty?
        p = queue.pop
        if p.left?
          queue << p
          dfs(p.left)
        end
        if p.right?
          queue <<p
          dfs(p.right)
        end
        puts p
      end
    end

  
  end
  


  def traverse()
   list = []
   yield @data
   list << @left if @left != nil
   list << @right if @right != nil
   loop do
    break if list.empty?
    node = list.shift
    yield node.data
    list << node.left if node.left != nil
    list << node.right if node.right != nil
   end
  end

  end


  tree = Tree.new
  (1..82).each do|x|
    if(x<45)
      node =Node.new(nil, "-")
      tree.insert node
    else
      node = Node.new(nil, "+")
      tree.insert node
    end
      
  end 
