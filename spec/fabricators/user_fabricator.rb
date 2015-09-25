Fabricator(:user) do
  name {sequence(:name) {|i| "User#{i}"}}
  role 2
  email {sequence(:email) {|i| "email#{i}@gmail.com"}}
  password "12345678"
  password_confirmation "12345678"
end
