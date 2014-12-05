class SlackAdapter
  def start!
    Hipbot.configuration.user = Hipbot::User.find_or_create_by(mention: "hipbot")
  end

  def restart!
    # NO-OP
  end

  def send_to_room(room, message)
    SlackConnector.message(room, message)
  end

  def send_to_user(user, message)
    # NO-OP
  end

  def set_presence(*)
    # NO-OP
  end

  def join_room(*)
    # NO-OP
  end
end

class HipbotNetguru < Hipbot::Bot
  configure do |c|
    c.adapter = SlackAdapter
    c.logger = Rails.logger
    c.storage = Hipbot::Storages::Hash
  end

  on /open the pod bay door/ do
    reply("I'm afraid I can't do that...")
  end

  on /hi/ do
    reply('Hello!')
  end

  on /http test/ do
    get('http://example.com') do |response|
      reply("code: #{response.code}, body size: #{response.body.size.to_s} characters")
    end
  end

  on_exception do |e|
    Rails.logger.info(e.message)
    Rails.logger.info(e.backtrace)
  end
end
