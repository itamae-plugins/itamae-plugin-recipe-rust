# Prepare for test
group "deploy"

user "deploy" do
  gid "deploy"
  shell "/bin/bash"
  create_home true
end

case node[:platform]
when "debian", "ubuntu"
  execute "apt-get update"

  [
    "sudo"
  ].each do |name|
    package name
  end
end

# Install to system
include_recipe "rust::system"

# Install to user home
node[:rust][:user] = "deploy"

include_recipe "rust::user"
