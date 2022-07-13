describe file("#{node["rust"]["cargo_home"]}/bin/rustc") do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

describe command("#{node["rust"]["cargo_home"]}/bin/rustc --version") do
  its(:stdout) { should_not be_empty }
  its(:stderr) { should be_empty }
  its(:exit_status) { should eq 0 }
end
