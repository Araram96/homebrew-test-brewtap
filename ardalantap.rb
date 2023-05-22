class Ardalantap < Formula
  desc "Test3"
  homepage "Araram96/test-brewtap"
  url "https://github.com/Araram96/homebrew-test-brewtap/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "11e45f4afb6ce1e201910e4e618a08395f38190527c29c28746f1124f3c8f3b5"
  license "MIT"
  
  depends_on "python@3.10.9"
  depends_on "cmake" => :build

  def install
    
    # Install the Python script
    libexec.install "test_script.py"

    # Make the Python script executable
    chmod "+x", libexec/"test_script.py"

    # Create a wrapper script that runs the Python script
    (bin/"ardalantap").write <<~EOS
      #!/usr/bin/env python3
      import os
      import sys

      # Path to the Python script
      script_path = os.path.join(os.path.dirname(__file__), '..', 'libexec', 'test_script.py')

      # Run the script with the given command-line arguments
      os.execv(sys.executable, [sys.executable, script_path] + sys.argv[1:])
    EOS

    # Make the wrapper script executable
    chmod "+x", bin/"ardalantap"
  
  end

  def caveats
    <<~EOS
      The Python script is installed in the following location:
        #{opt_libexec}/test_script.py

      You can run it using the "ardalantap" command.
    EOS
  end

  test do
    # Add test code here to verify the installation
    system "#{bin}/ardalantap", "--version"
  end

end

