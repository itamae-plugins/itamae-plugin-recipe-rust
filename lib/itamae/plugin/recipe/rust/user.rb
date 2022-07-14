node.reverse_merge!(
  rust: {
    user: ENV["USER"],
  },
)

unless node[:rust][:cargo_home]
  user_dir =
    case node[:platform]
    when "osx", "darwin"
      "/Users"
    else
      "/home"
    end

  node[:rust][:cargo_home] = File.join(user_dir, node[:rust][:user], ".cargo")
end

include_recipe "rust::install"
