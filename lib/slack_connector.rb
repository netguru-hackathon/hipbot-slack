class SlackConnector

  def self.message(room, message)
    HTTParty.post(ENV['SLACK_INCOMING_WEBHOOK'], body: { text: message }.to_json, headers: { 'Content-Type' => 'application/json' })
  end

end
