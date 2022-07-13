cargo_home = "/usr/local/cargo"

describe file("#{cargo_home}/bin/rustc") do
  it { should be_file }
  it { should exist }
  it { should be_executable }
end

describe command("#{cargo_home}/bin/rustc --version") do
  its(:stdout) { should include node["rust"]["version"] }
  its(:stderr) { should be_empty }
  its(:exit_status) { should eq 0 }
end
