
class Ardalantap < Formula
  desc "this is an ardalan test"
  homepage "https://github.com/Araram96/test-brewtap"
  url "https://github.com/Araram96/test-brewtap/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "baed683334805c32178038242368ccefcaccfcf8ad8e0f658241f1a499b3fe88"
  license "MIT"

  # depends_on "cmake" => :build

  def install

    libexec.install 'test_script.py' => 'test_script'
  end
end 

