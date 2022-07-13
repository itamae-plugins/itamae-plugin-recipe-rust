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

include_recipe "rust::user"
