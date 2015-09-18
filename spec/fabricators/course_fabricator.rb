Fabricator(:course) do
  name {sequence(:name) {|i| "Course#{i}"}}
  description {Faker::Lorem.sentence}
  status {%w(init progress finish).sample}
  after_create do |course|
    5.times do
      Fabricate :course_subject, course: course
      Fabricate :user_course, course: course
    end
  end
end
