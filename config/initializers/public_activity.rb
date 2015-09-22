PublicActivity::Activity.class_eval do
  scope :user_activities, ->user_id{where "owner_id = ?", user_id}
  scope :recent, ->{order "created_at DESC"}
  scope :course_activities, ->course_id{where "recipient_id = ?", course_id}
end
