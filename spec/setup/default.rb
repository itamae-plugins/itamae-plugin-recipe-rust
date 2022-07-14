case node[:platform]
when "debian", "ubuntu"
  execute "apt-get update"

  [
    "sudo"
  ].each do |name|
    package name
  end

when "amazon"
  # `groupadd` isn't installed in https://hub.docker.com/_/amazonlinux
  package "shadow-utils"
end
