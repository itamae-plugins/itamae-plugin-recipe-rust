node.reverse_merge!(
  rust: {
    user: ENV["USER"],
  },
)

unless node[:rust][:cargo_home]
  case node[:platform]
  when "osx", "darwin"
    user_dir = "/Users"
  else
    user_dir = "/home"
  end
  node[:rust][:cargo_home] = File.join(user_dir, node[:rust][:user], ".cargo")
end

include_recipe "rust::install"
