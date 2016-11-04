# set up the minimal conf required for someone to log in and test.

group = Group.create name: 'Test Group',
                     description: 'Application test group',
                     oauth_consumer_key: SecureRandom.hex(24),
                     oauth_consumer_secret: SecureRandom.hex(24)

random_pw = SecureRandom.hex(24)

user = User.create username: 'enduser',
                   password: random_pw,
                   password_confirmation: random_pw

user.groups << group

puts "An initial test user has been created."
puts "  User 'enduser', password '#{random_pw}'"
