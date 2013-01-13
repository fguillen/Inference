require "csv"

class Inference::Script
  attr_reader :script
  attr_reader :minutes_ago
  attr_reader :dir_name
  attr_reader :file_name

  def initialize(widget, minutes_ago = nil)
    @script = widget.script.dup
    @minutes_ago = minutes_ago || widget.minutes_ago
    @dir_name = File.dirname(widget.image_path)
    @file_name = File.basename(widget.image_path)

    FileUtils.mkdir_p dir_name
    FileUtils.mkdir_p "#{dir_name}/data"

    puts "XXX: script: #{script}"
  end

  def get_values(array_of_hashes, key)
    array_of_hashes.map { |e| e[key] }
  end

  def get_keys
    puts "XXX: get_keys.script: #{script}"
    script.scan( /\{\{([^\{\}]*)\}\}/ ).flatten.uniq
  end

  def load_keys_elements(elements, key)
    csv_string =
      CSV.generate do |csv|
        csv << ["timestamp", "value"]
        elements.each do |element|
          csv << [element["timestamp"], element["value"]]
        end
      end

    csv_path = "#{dir_name}/data/#{key}.csv"
    File.open(csv_path, "w") { |f| f.write csv_string }

    "#{key} <- read.csv(\"#{csv_path}\")"
  end

  def load_keys_header
    result = ""

    puts "XXX: get_keys: #{get_keys.inspect}"

    get_keys.each do |key|
      elements = Inference::RedisWrapper.get(key, minutes_ago.minutes.ago, Time.now)
      result += load_keys_elements(elements, key)
      result += "\n"
    end

    result
  end

  def clean!
    script.gsub!("\r\n", "\n")
  end

  def remplace_special_variables!
    script.gsub!("{{x_ini}}", minutes_ago.minutes.ago.to_i.to_s)
    script.gsub!("{{x_end}}", Time.now.to_i.to_s)
  end

  def remplace_keys!
    get_keys.each do |key|
      script.gsub!( "{{#{key}}}", key )
    end
  end

  def wrap!
    clean!
    remplace_special_variables!

    result = "#{load_keys_header}\n"
    result += "setwd('#{dir_name}')\n"
    result += "jpeg('chart.jpg')\n"

    remplace_keys!
    result += "#{script}\n"

    result += "dev.off()\n"

    @script = result
  end

  def execute
    wrap!

    R.eval script
  end


end