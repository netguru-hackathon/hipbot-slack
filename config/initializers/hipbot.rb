require 'hipbot-plugins'

# HACK
Thread.new do
  HipbotNetguru.start!
end
