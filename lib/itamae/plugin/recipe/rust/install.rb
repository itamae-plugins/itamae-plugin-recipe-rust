# c.f. https://www.rust-lang.org/learn/get-started

[
  "curl"
].each do |name|
  package name
end

rust_env = "CARGO_HOME=#{node[:rust][:cargo_home]}"
rustc  = "#{rust_env} #{node[:rust][:cargo_home]}/bin/rustc"
rustup = "#{rust_env} #{node[:rust][:cargo_home]}/bin/rustup"

execute "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | #{rust_env} sh -s -- -y" do
  not_if "#{rustc} --version"

  if node[:rust][:user]
    user node[:rust][:user]
  end
end

if node[:rust][:version]
  rustup_install = "#{rustup} install #{node[:rust][:version]}"

  if node[:rust][:rustup_install_option]
    rustup_install << " #{node[:rust][:rustup_install_option]}"
  end

  execute rustup_install do
    not_if "#{rustc} --version | grep #{node[:rust][:version]}"

    if node[:rust][:user]
      user node[:rust][:user]
    end
  end

  execute "#{rustup} default #{node[:rust][:version]}" do
    not_if "#{rustc} --version | grep #{node[:rust][:version]}"

    if node[:rust][:user]
      user node[:rust][:user]
    end
  end
end
