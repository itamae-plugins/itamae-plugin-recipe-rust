node.reverse_merge!(
  rust: {
    cargo_home: "/usr/local/cargo",
  },
)

include_recipe "rust::install"
