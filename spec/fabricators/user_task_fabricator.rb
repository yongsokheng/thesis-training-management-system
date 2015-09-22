Fabricator(:user_task) do
  UserTask.public_activity_off
  user {User.all.sample}
  task {Task.all.sample}
  user_subject
end
