require 'test_helper'

class DayTest < ActiveSupport::TestCase
  def setup
    @day = days(:one)
  end

  test "should be valid" do
    assert @day.valid?
  end
  
  test "date should be present" do
    @day.date = ""
    assert_not @day.valid?
  end
  
  test "month should be present" do
    @day.month = ""
    assert_not @day.valid?
  end
  
  test "day should be present" do
    @day.day = ""
    assert_not @day.valid?
  end
  
  test "year should be present" do
    @day.year = ""
    assert_not @day.valid?
  end
  
  test "number_of_pickups should be present" do
    @day.number_of_pickups = ""
    assert_not @day.valid?
  end
  
  test "created_at should be present" do
    @day.created_at = ""
    assert_not @day.valid?
  end
  
  test "updated_at should be present" do
    @day.updated_at = ""
    assert_not @day.valid?
  end
  
  test "status should be present" do
    @day.status = ""
    assert_not @day.valid?
  end
end
