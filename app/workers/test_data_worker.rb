class TestData
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    puts "TestData: start create test data"
    createUsers
    puts "TestData: success!"
  end

  def createUsers
    puts "creating users.."
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n + 1}@railstutorial.org"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
      puts "created User with name: " + name + ", email: " + email + ", password: " + password
    end
    puts "ended"
  end

end