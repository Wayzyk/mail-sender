class Notification < ApplicationRecord
  validates :message_id, :body, presence: true
  validates :message_id, uniqueness: true

  def greeting(user)
    "Hello, #{user.full_name}. Welcome aboard!"
  end
end
