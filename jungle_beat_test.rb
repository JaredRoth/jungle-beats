require "minitest"
require_relative 'jungle_beat'


# Test if things still work with an empty list
class JungleBeatTest < Minitest::Test
  def test_takes_arguments_properly
    jb = JungleBeat.new("deep dep dep deep")

    assert_equal "deep", jb.head.data
  end
  def test_can_initialize_without_arguments
    jb = JungleBeat.new

    assert_equal nil, jb.head
    assert_equal "The list is empty", jb.all
  end
  def test_play
    jb = JungleBeat.new("deep dep dep deep")

    assert_equal 4, jb.play
  end
  def test_append
    jb = JungleBeat.new("deep dep dep deep")

    assert_equal 3, jb.append("do doo dooo")
    assert_equal "deep dep dep deep do doo dooo", jb.all
  end
  def test_prepend
    jb = JungleBeat.new("deep dep dep deep")

    assert_equal 3, jb.prepend("do doo dooo")
    assert_equal "do doo dooo deep dep dep deep", jb.all
  end
  def test_insert
    ja = JungleBeat.new("deep dep dep deep")
    jb = JungleBeat.new("deep dep dep deep")
    jc = JungleBeat.new("deep dep dep deep")

    assert_equal "deep dep do doo dep deep", ja.insert(2, "do doo")
    assert_equal "deep do doo dep dep deep", jb.insert(1, "do doo")
    assert_equal "Use prepend to add to the beginning", jc.insert(0, "do doo")
    assert_equal "List is only 6 nodes long, use append to add to the end", jb.insert(7, "thing")
  end
  def test_include?
    jb = JungleBeat.new("deep dep dep deep dwop")

    assert_equal true, jb.include?("dep")
    assert_equal true, jb.include?("dwop")
    assert_equal false, jb.include?("do")
  end
  def test_pop
    jb = JungleBeat.new("deep dep do dep doo deep")

    assert_equal "doo deep", jb.pop(2)
    assert_equal "deep dep do dep", jb.all
    assert_equal "dep", jb.pop
    assert_equal "deep dep do", jb.all
    assert_equal "do", jb.pop
    assert_equal "deep dep", jb.all
    assert_equal "The list only has 2 nodes", jb.pop(4)
  end
  def test_count
    jb = JungleBeat.new("deep dep dep deep")

    assert_equal 4, jb.count
    jb.append("three more words")
    assert_equal 7, jb.count
  end
  def test_find
    jb = JungleBeat.new("deep dep doop dop deep dep deep")

    assert_equal "dep doop", jb.find(1,2)
    assert_equal "deep dep doop", jb.find(0,3)
    assert_equal "The list is not that long, it only has 7 nodes", jb.find(4,5)
  end
  def test_all
    jb = JungleBeat.new("deep dep dep deep")

    assert_equal "deep dep dep deep", jb.all
  end
end
