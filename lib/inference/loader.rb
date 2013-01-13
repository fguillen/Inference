module Inference::Loader
  def self.load_json(key, file_path)
    file_path = File.expand_path file_path
    puts "XXX: load_json.key: #{key}"
    puts "XXX: load_json.file_path: #{file_path}"

    data_text = File.read(file_path)
    puts "XXX: data_text: #{data_text}"

    data = JSON.parse data_text
    data[0]["datapoints"].each do |datapoint|
      puts "XXX: inserting datapoint: #{datapoint.inspect}"
      Inference::Client.insert(key, Time.at(datapoint[1]), datapoint[0]) if datapoint[0]
    end
  end
end