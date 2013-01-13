namespace :inference  do
  desc "Insert fake data in Redis"
  task :fake_data => :environment do
    key = ENV["KEY"]

    if !key
      puts "user: $ rake inference:fake_data KEY=<key>"
      exit 1
    end

    Inference::RedisWrapper.del key

    value = rand(100)
    100.times do |index|
      timestamp = index.minutes.ago.to_i
      value = value + (-2..2).to_a.sample
      Inference::Client.insert(key, timestamp, value)
    end
  end

  desc "Insert fake data in Redis"
  task :load_json => :environment do
    key = ENV["KEY"]
    file_path = ENV["FILE_PATH"]

    if !key || !file_path
      puts "user: $ rake inference:load_json KEY=<key> FILE_PATH=<file_path>"
      exit 1
    end

    Inference::Loader.load_json key, file_path
  end

end

