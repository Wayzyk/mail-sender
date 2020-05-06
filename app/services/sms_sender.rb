class SmsSender
  attr_reader :user_id, :message_id, :current_user, :current_notification

  def initialize(user_id, message_id)
    @user_id = user_id
    @message_id = message_id
    fetch_user_notification
  end

  def call
    return err if current_user.nil? || current_notification.nil?

    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV["TWILIO_SENDER_PHONE"],
      to: current_user.phone,
      body: current_notification.greeting(current_user)
    })
  end

  def err
    err_message = []
    err_message << "User with ID:#{user_id} not found!" unless current_user
    err_message << "Notification '#{txt_id}' not found!" unless current_notification
    err_message.join(', ')
  end

  private

  def fetch_user_notification
    @current_user = User.find_by_id(user_id)
    @current_notification = Notification.find_by_message_id(message_id)
  end
end
