Fabricator(:subject) do
  name {sequence(:name) {|i| "subject#{i}"}}
  description {Faker::Lorem.sentence}

  after_create do |subject|
    5.times do
      Fabricate :task_master, subject: subject
    end
  end
end
