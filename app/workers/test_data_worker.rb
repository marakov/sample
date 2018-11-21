class TestDataWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform
    puts "TestData: start create test data"
    createUsers
    createRandomSubscribes
    createRandomLikes
    puts "TestData: success!"
  end

  def createRandomLikes
    puts "creating likes.."
    size = Feed.all.size
    unless size == 0
      feeds = Feed.all.entries
      User.all.each do |user|
        numberOfLikes = rand(0..50)
        i = 0
        while i < numberOfLikes
          number = rand(0..200)
          f = feeds[number]
          f.liked_by user
          i += 1
        end
      end
    end
    puts "ended"
  end

  def createUsers
    puts "creating users.."
    50.times do |n|
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

  def createRandomSubscribes
    puts "creating subscribes.."
    size = Channel.all.size
    unless size == 0
      channels = Channel.all.entries
      User.all.each do |user|
        if user.channels.entries.size == 0
          numberOfSubs = rand(0..size)
          i = 0
          while i < numberOfSubs
            ch = channels[i]
            s = Subscribe.new(user_id: user.id, channel_id: ch.id)
            if s.save
              puts "created Subscribe with user: " + user.name + ", channel: " + ch.name
            else
              puts "unable to save subscribe with user: " + user.name + ", channel: " + ch.name
            end
            i += 1
          end
        else
          puts "user already have at least one subscribe: " + user.name
        end
      end
    else
      puts "There is no channels. Unable to subscribe"
    end
    puts "ended"
  end

end