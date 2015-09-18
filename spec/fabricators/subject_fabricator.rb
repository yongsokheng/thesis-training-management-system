Fabricator(:subject) do
  name {sequence(:name) {|i| "subject#{i}"}}
  description {Faker::Lorem.sentence}

  after_create do |subject|
    Fabricate :task, subject: subject
  end
end
