require_relative 'node'

class JungleBeat
  attr_reader :head
  def initialize(beats)
    holder = beats.split
    @head = Node.new(holder.shift)

    holder.each do |word|
      to_end.link = Node.new(word)
    end
  end

  def to_end
    current = @head
    while !current.tail?
      current = current.link
    end
    current
  end

  def append(words)
    holder = words.split
    holder.each do |word|
      to_end.link = Node.new(word)
    end
  end

  def prepend(words)
    words.split.each do |word|
      @head = Node.new(word, @head)
    end
  end
end

jb = JungleBeat.new("deep dep dep deep")
jb.prepend("first second third")
p jb.head
