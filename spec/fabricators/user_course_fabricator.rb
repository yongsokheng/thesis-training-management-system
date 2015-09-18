Fabricator(:user_course) do
  active {%w(0 1).sample}
  user {User.all.sample}
  course

  after_create do |user_course|
    5.times do
      Fabricate :user_subject, user_course: user_course, user: user_course.user,
        course: user_course.course
    end
  end
end
