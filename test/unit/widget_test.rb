require "test_helper"

class WidgetTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FactoryGirl.create(:widget).valid?
  end

  def test_image
    widget = FactoryGirl.create(:widget, :script => fixture_read("r_scripts/1.r"))
    widget.image
  end

  def test_image_execute
    widget = FactoryGirl.create(:widget, :script => fixture_read("r_scripts/keys.r"))
    widget.image_execute
  end

  def test_script_get_keys
    widget = FactoryGirl.create(:widget, :script => fixture_read("r_scripts/keys.r"))
    puts "XXX: script_get_keys: #{widget.script_get_keys}"
  end

  def test_script_load_keys_header
    widget = FactoryGirl.create(:widget, :script => fixture_read("r_scripts/keys.r"))
    puts "XXX: script_load_keys_header: #{widget.script_load_keys_header}"
  end
end
