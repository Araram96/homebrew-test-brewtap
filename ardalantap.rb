class Ardalantap < Formula
  desc "Test3"
  homepage "https://github.com/Araram96/test-brewtap"
  url "https://github.com/Araram96/test-brewtap/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "6a86f1e8ffaa66b7ae9c4d9303b30bd34a96c804886252b535eb04d9e333eb8a"
  license "MIT"
  
  depends_on "python@3.10"
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

