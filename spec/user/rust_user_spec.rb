describe file("/home/#{node["rust"]["user"]}/.cargo/bin/rustc") do
  it { should be_file }
  it { should exist }
  it { should be_executable }
  it { should be_owned_by node["rust"]["user"] }
end

describe command("sudo -u #{node["rust"]["user"]} /home/#{node["rust"]["user"]}/.cargo/bin/rustc --version") do
  its(:stdout) { should include node["rust"]["version"] }
  its(:stderr) { should be_empty }
  its(:exit_status) { should eq 0 }
end
