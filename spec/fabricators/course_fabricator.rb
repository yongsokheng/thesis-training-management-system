Fabricator(:course) do
  name {sequence(:name) {|i| "Course#{i}"}}
  description {Faker::Lorem.sentence}
  status 0
end
