# Project Title

Notification sender with sms or email

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* Ruby - version 2.7.0 or higher
* Rails - version 6.0.x
* PostgreSQL - version 11 or higher

## Deployment

Clone project

```
git clone https://github.com/Wayzyk/notification-sender.git
```

Install gems and create db

```
bundle install

rake db:setup
```

Create env file

```
cp .env.example .env
```

1. If you don’t already have a Twilio account, sign up for a free trial. Make sure that the number you pick has SMS capabilities.

```
https://www.twilio.com/try-twilio
```

2. After you sign up, Twilio will ask you to verify your personal phone number. With a free trial account, this is the only number you can send texts to, but that’s okay for this app.

![alt text](https://twilio-cms-prod.s3.amazonaws.com/images/QHGRwOCw38MS1xttQnLlS1ejn3NgL6GB3PywkQdjcjfFAF.width-500.png)

3. Click the house icon on the top left corner of the https://www.twilio.com/console and paste your Account SID and Auth Token in your env file. For getting trial number click on the button "Get trial number" and paste this number to TWILIO_SENDER_PHONE variable in env file.

# Send sms to your phone

```
rails c
```

Create new user

```
 User.create!(first_name: 'Name', last_name: 'Surname', email: 'test@test.com', phone: 'your phone')

  Notification.create!(message_id: '1', body: 'Hello')
```

Send sms

```
SmsSender.new(user_id, message_id).call
```

If you can't call SmsSender from console

```
bin/spring stop

rails c

ActiveSupport::Dependencies.autoload_paths - check if the services folder is listed

```

# Send email

```
rails c
```

Create new user

```
 user = User.create!(first_name: 'Name', last_name: 'Surname', email: 'test@test.com', phone: 'your phone')
 ```

 Send Email

 ```
 UserMailer.sample_email(user).deliver
```
