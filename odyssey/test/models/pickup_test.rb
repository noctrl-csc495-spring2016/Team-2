require 'test_helper'

class PickupTest < ActiveSupport::TestCase
  
  def setup 
    @pickup = Pickup.new(donor_name: "Kyle Loveless", donor_city: "Lisle",
    donor_zip: "60532", donor_address_line1: "555 Main St", donor_email: 
    "test@example.com", donor_dwelling_type: "House")
  end
  
  test "should be valid" do
    assert @pickup.valid?
  end
  
  test "name should be present" do
    @pickup.donor_name = ""
    assert_not @pickup.valid?
  end
  
  test "city should be present" do
    @pickup.donor_city = ""
    assert_not @pickup.valid?
  end
  
  test "zip should be present" do
    @pickup.donor_zip = ""
    assert_not @pickup.valid?
  end
  
  test "address line 1 should be present" do
    @pickup.donor_address_line1 = ""
    assert_not @pickup.valid?
  end
  
  test "email should be present" do
    @pickup.donor_email = ""
    assert_not @pickup.valid?
  end
  
  test "dwelling type should be present" do
    @pickup.donor_dwelling_type = ""
    assert_not @pickup.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @pickup.donor_email = valid_address
      assert @pickup.valid?, "#{valid_address.inspect} should be valid"
    end
  end
  
end
