class Widget < ActiveRecord::Base
  attr_protected nil

  def image_path
    "#{Rails.root}/public/widgets/#{id}/chart.jpg"
  end

  def image_execute(minutes_ago = minutes_ago)
    Inference::Script.new(self, minutes_ago).execute
    image_url
  end

  def image_url
    "/widgets/#{id}/chart.jpg"
  end

  def script_parsing_errors
    puts "XXX: TODO: very ugly to have to run the scripts just to see if there is any error"
    begin
      Inference::Script.new(self).execute
    rescue Exception => e
      puts "XXX: error parsing: #{e.message}"
      puts "XXX: stact:"
      puts e.backtrace.join("\n")
      return e.message
    end

    false
  end
end
