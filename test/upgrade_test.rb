require 'helper'

class UpgradeTest < Rip::Test
  def setup
    ENV['RIPRPG'] = '0'
    super
  end

  test "upgrade a git package" do
    rip "install #{fixture('cijoe-deps.rip')}"

    assert File.exist?("#{@ripdir}/base/lib/cijoe.rb")

    out = rip "upgrade git://localhost/cijoe"

    assert_exited_successfully out
    assert File.exist?("#{@ripdir}/base/lib/cijoe.rb")
  end

  test "upgrade a gem" do
    rip "install repl"

    assert File.exist?("#{@ripdir}/base/bin/repl")

    out = rip "upgrade repl"

    assert_exited_successfully out
    assert File.exist?("#{@ripdir}/base/bin/repl")
  end
end