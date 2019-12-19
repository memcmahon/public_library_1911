require 'minitest/autorun'
require 'pry'
require './lib/author'

class AuthorTest < Minitest::Test
  def test_it_exists
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
    })

    assert_instance_of Author, charlotte_bronte
  end

  def test_it_has_attributes
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
    })

    assert_equal 'Charlotte Bronte', charlotte_bronte.name
    assert_equal [], charlotte_bronte.books
  end

  def test_it_can_write
    charlotte_bronte = Author.new({
      first_name: "Charlotte",
      last_name: "Bronte"
    })

    jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = charlotte_bronte.write("Villette", "1853")

    assert_instance_of Book, villette
    assert_equal 'Charlotte Bronte', villette.author
    assert_equal '1853', villette.publication_year
    assert_equal 'Villette', villette.title
    assert_equal [jane_eyre, villette], charlotte_bronte.books
  end
end
