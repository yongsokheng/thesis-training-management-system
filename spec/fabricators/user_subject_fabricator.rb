Fabricator(:user_subject) do
  status {%w(0 1).sample}
  subject {Subject.all.sample}
  course
  user_course
  user

  after_create do |user_subject|
    5.times do
      Fabricate :user_task, user_subject: user_subject
    end
  end
end
