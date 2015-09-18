Fabricator(:user_task) do
  user {User.all.sample}
  task {Task.all.sample}
  user_subject
end
