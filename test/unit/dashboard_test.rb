require "test_helper"

class DashboardTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert FactoryGirl.create(:dashboard).valid?
  end
end
