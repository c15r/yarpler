require 'test/unit'
require 'require_all'
require_all 'lib'

def read_test_file(filename)
  content = ''
  file = File.new(filename, 'r')
  content << file.read
  file.close
  content
end

TEST_DATA_PATH = 'tests/data/'
TEST_COMBINED_FILE = TEST_DATA_PATH + 'combined.yai'
TEST_SINGLE_FILES = TEST_DATA_PATH + 'single'

# TestCase to test the YARPLER utils
class TestUtils < Test::Unit::TestCase
  def setup
    @test_data_path = 'tests/data/'
  end

  def test_load_yai_file
    file_content = read_test_file(TEST_COMBINED_FILE)
    file = Yarpler::Utils::FileLoader.new(TEST_COMBINED_FILE)
    assert_equal(file_content, file.get_content)
  end

  def test_load_yai_and_yad_file
    file_content = read_test_file(TEST_SINGLE_FILES + '.yad') + read_test_file(TEST_SINGLE_FILES + '.yai')
    file = Yarpler::Utils::FileLoader.new(TEST_SINGLE_FILES + '.yai')
    assert_equal(file_content, file.get_content)
  end
end
