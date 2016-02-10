class Node
  attr_accessor :link
  attr_reader :data

  def initialize(data, link=nil)
    @data = data
    @link = link
  end
end
