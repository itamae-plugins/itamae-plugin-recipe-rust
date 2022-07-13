test_user = "deploy"

describe file("/home/#{test_user}/.cargo/bin/rustc") do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

describe command("sudo -u #{test_user} /home/#{test_user}/.cargo/bin/rustc --version") do
  its(:stdout) { should include node["rust"]["version"] }
  its(:stderr) { should be_empty }
  its(:exit_status) { should eq 0 }
end
