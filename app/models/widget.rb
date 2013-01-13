class Widget < ActiveRecord::Base
  attr_protected nil

  def image_path
    "#{Rails.root}/public/widgets/#{id}/chart.jpg"
  end

  def image_execute(minutes_ago = minutes_ago)
    begin
      Inference::Script.new(self, minutes_ago).execute
    rescue Exception => e
      puts "XXX: error parsing: #{e.message}"
      puts "XXX: stact:"
      puts e.backtrace.join("\n")
      return e.message
    end

    image_url
  end

  def image_url
    "/widgets/#{id}/chart.jpg"
  end
end
