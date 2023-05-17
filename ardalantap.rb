
# class Ardalantap < Formula
#   desc "this is an ardalan test"
#   homepage "https://github.com/Araram96/test-brewtap"
#   url "https://github.com/Araram96/test-brewtap/archive/refs/tags/v0.2.0.tar.gz"
#   sha256 "baed683334805c32178038242368ccefcaccfcf8ad8e0f658241f1a499b3fe88"
#   license "MIT"

#   # depends_on "cmake" => :build

#   def install
    
#     bin.install 'test_script.py' => 'test_script'

#   end

# end

class Ardalantap < Formula
  desc "This is an Ardalan test"
  homepage "https://github.com/Araram96/test-brewtap"
  url "https://github.com/Araram96/test-brewtap/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "baed683334805c32178038242368ccefcaccfcf8ad8e0f658241f1a499b3fe88"
  license "MIT"
  
  def install
    # Extract the contents of the archive
    extract_dir = "#{name}-#{version}"
    system "tar", "xf", "#{name}-#{version}.tar.gz"

    # Install the script to the libexec directory
    libexec.install "#{extract_dir}/test_script.py"

    # Create a wrapper script in bin to execute the Python script
    (bin/"test_script").write <<~EOS
      #!/usr/bin/env python3
      # This is a wrapper script to execute test_script.py
      import os
      import sys

      script_path = os.path.join(os.path.dirname(__file__), "../libexec/test_script.py")
      sys.argv[0] = script_path
      exec(compile(open(script_path, "rb").read(), script_path, 'exec'))
    EOS

    # Set the wrapper script to be executable
    chmod "+x", bin/"test_script"
  end

  test do
    # Add test code if applicable
  end
end
