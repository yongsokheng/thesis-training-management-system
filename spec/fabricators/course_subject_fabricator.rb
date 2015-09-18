Fabricator(:course_subject) do
  active {%w(init progress finish).sample}
  subject {Subject.all.sample}
  course
end
