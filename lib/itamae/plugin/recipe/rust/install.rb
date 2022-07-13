# c.f. https://www.rust-lang.org/learn/get-started

[
  "curl"
].each do |name|
  package name
end

execute "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y" do
  not_if "#{node[:rust][:cargo_home]}/bin/rustc --version"

  if node[:rust][:user]
    user node[:rust][:user]
  end
end

install_command = "#{node[:rust][:cargo_home]}/bin/rustup install --profile minimal"
check_command   = "#{node[:rust][:cargo_home]}/bin/rustc --version"

if node[:rust][:version]
  install_command << " #{node[:rust][:version]}"
  check_command   << " | grep #{node[:rust][:version]}"
end

execute install_command do
  not_if check_command

  if node[:rust][:user]
    user node[:rust][:user]
  end
end

if node[:rust][:version]
  execute "#{node[:rust][:cargo_home]}/bin/rustup default #{node[:rust][:version]}" do
    not_if "#{node[:rust][:cargo_home]}/bin/rustc --version | grep #{node[:rust][:version]}"

    if node[:rust][:user]
      user node[:rust][:user]
    end
  end
end
