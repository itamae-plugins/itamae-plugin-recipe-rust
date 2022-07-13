# c.f. https://www.rust-lang.org/learn/get-started

[
  "curl"
].each do |name|
  package name
end

rust_env = "CARGO_HOME=#{node[:rust][:cargo_home]}"
rustc  = "#{node[:rust][:cargo_home]}/bin/rustc"
rustup = "#{node[:rust][:cargo_home]}/bin/rustup"

execute "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | #{rust_env} sh -s -- -y" do
  not_if "#{rustc} --version"

  if node[:rust][:user]
    user node[:rust][:user]
  end
end

install_command = "#{rust_env} #{rustup} install --profile minimal"
check_command   = "#{rust_env} #{rustc} --version"

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
  execute "#{rust_env} #{rustup} default #{node[:rust][:version]}" do
    not_if "#{rust_env} #{rustc} --version | grep #{node[:rust][:version]}"

    if node[:rust][:user]
      user node[:rust][:user]
    end
  end
end