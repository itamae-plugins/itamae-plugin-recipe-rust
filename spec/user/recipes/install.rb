include_recipe "../../setup"

user node["rust"]["user"] do
  shell "/bin/bash"
  create_home true
end

include_recipe "rust::user"
