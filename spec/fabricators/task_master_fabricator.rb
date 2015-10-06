Fabricator(:task_master) do
  name {sequence(:name) {|i| "Task#{i}"}}
  description {Faker::Lorem.sentence}
  subject
end
