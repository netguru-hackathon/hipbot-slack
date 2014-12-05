Hipbot::Room.send(:include, Hipbot::Storages::Hash)
Hipbot::User.send(:include, Hipbot::Storages::Hash)

HipbotNetguru.instance.start!
