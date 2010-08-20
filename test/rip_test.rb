require 'helper'

class RipTest < Rip::Test
  def with_local_path
    old_path = ENV['PATH']
    ENV['PATH'] = "bin:#{ENV['PATH']}"
    yield
    ENV['PATH'] = old_path
  end

  test "rip prints error message for invalid command" do
    with_local_path do
      expected = "'invalid' is not a rip command. See rip's commands with 'rip commands'."
      assert_equal expected, `rip invalid 2>&1`.chomp
      assert_exited_with_error
    end
  end

  test "rip help prints command help message" do
    with_local_path do
      assert_includes "Usage: rip-env", `rip help env`
    end
  end

  test "rip help prints error message for invalid command" do
    with_local_path do
      expected = "'invalid' is not a rip command. See rip's commands with 'rip commands'."
      assert_equal expected, `rip help invalid 2>&1`.chomp
      assert_exited_with_error
    end
  end

  test "rip --help prints general help" do
    with_local_path do
      assert_includes "Installation:", `rip --help`
    end
  end

  test "rip with no arguments prints general help" do
    with_local_path do
      assert_includes "Installation:", `rip --help`
    end
  end

  test "rip help prints general help" do
    with_local_path do
      assert_includes "Installation:", `rip --help`
    end
  end

  test "rip ignores invalid option and prints general help" do
    with_local_path do
      assert_includes "Installation:", `rip -z`
    end
  end
end