class SlackAdapter
  def start!
    # NO-OP
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

  on /open the pod bay door/, global: true do
    reply("I'm afraid I can't do that...")
  end
end
