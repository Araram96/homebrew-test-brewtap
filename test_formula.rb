class TestFormula < Formula
  desc "this formula just throw a text output"
  homepage "https://github.com/Araram96/test-brewtap"
  url "https://github.com/Araram96/test-brewtap/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "a2377ea78879ed2e740f2782604a6800317425458ad0daf91261398232506149"
  license "MIT"

  def install
        bin.install "test_script"
  end

end
