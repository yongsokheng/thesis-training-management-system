Fabricator(:permission) do
  name {sequence(:name) {|i| "Permission#{i}"}}
  role
end
