require_relative 'node'
require 'pry'

class JungleBeat
  attr_reader :head
  def initialize(beats = nil)
    return @head = nil if !beats
    holder = beats.split
    @head = Node.new(holder.shift)

    holder.each do |word|
      traverse.link = Node.new(word)
    end
  end

  def traverse
    current = @head
    while current.link
      yield current if block_given?
      current = current.link
    end
    block_given? ? (yield current) : current
  end

  def traverse_to(index)
    current = @head
    count = 0
    until count == index
      current = current.link
      count += 1
    end
    current
  end

  def play
    count = 0
    traverse do |current|
      # `say -r 500 -v Boing "#{current.data}"`
      count += 1
    end
    count
  end

  def append(words)
    count = 0
    words.split.each do |word|
      traverse.link = Node.new(word)
      count += 1
    end
    count
  end

  def prepend(words)
    count = 0
    words.split.reverse.each do |word|
      @head = Node.new(word, @head)
      count += 1
    end
    count
  end

  def insert(index, words)
    if index == 0
      return "Use prepend to add to the beginning"
    elsif index > count
      return "List is only #{count} nodes long, use append to add to the end"
    end
    current = traverse_to(index - 1)
    temp_link = current.link
    current.link = nil
    append(words)
    traverse.link = temp_link
    all
  end

  def include?(word)
    traverse do |current|
      if word == current.data
        return true
      else
        false
      end
    end
  end

  def pop(amount=1)
    if amount > count
      return "The list only has #{count} nodes"
    end
    output = []
    amount.times do
      current = @head
      while current.link.link
        current = current.link
      end
      output.unshift(current.link.data)
      current.link = nil
    end
    output.join(" ")
  end

  def count
    count = 0
    traverse do
      count += 1
    end
    count
  end

  def find(index, amount=1)
    if index + amount > count
      return "The list is not that long, it only has #{count} nodes"
    end
    output = []
    amount.times do
      output.push(traverse_to(index).data)
      index += 1
    end
    output.join(" ")
  end

  def all
    return "The list is empty" if !@head
    output = ""
    traverse do |current|
      output << "#{current.data} "
    end
    output.chop
  end
end
