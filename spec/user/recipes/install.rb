include_recipe "../../setup"

group "deploy"

user "deploy" do
  gid "deploy"
  shell "/bin/bash"
  create_home true
end

include_recipe "rust::user"
