Fabricator(:course_subject) do
  CourseSubject.public_activity_off

  active {%w(init progress finish).sample}
  subject {Subject.all.sample}
  course
end
