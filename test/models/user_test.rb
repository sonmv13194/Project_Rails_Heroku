require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name:"Example user",email:"Example@gmail.com",address:"Example",password:"maison",password_confirmation:"maison")
  end

  test "should be valid" do
  	  assert @user.valid?
	end

  test "name should be present" do
  	@user.name = "        "
  	assert_not @user.valid?
  end	

  test "email should be present" do
  	@user.email ="        "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "a" * 255
  	assert_not @user.valid?
  end

  test "email should not be too long" do
  	@user.email = "b" * 255 + "@gmail.com"
  	assert_not @user.valid?
  end

  test "email validation should accept valid rigth email" do
  	valid_email = %w[user@example.com USER@foo.com A_US-USER@foo.bar.org 
  					first.last@foo.jp alice+bob@baz.cn]
  	valid_email.each do | valid_email |
  	@user.email = valid_email
  	assert @user.valid?, "#{valid_email.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
      end
    end

   test "email should be unique" do
   	 duplicate_user = @user.dup
   	 duplicate_user.email = @user.email.upcase
   	 @user.save
   	 assert_not duplicate_user.valid?
   end

   test "email should be saved as lower case" do
   		mixed_case_email = "SON@Gmail.COm"
   		@user.email = mixed_case_email
   		@user.save
   		assert_equal mixed_case_email.downcase, @user.reload.email
   end

   test "password should not be blank" do
   		@user.password = @user.password_confirmation = " " *5
   		assert_not @user.valid?
   end

   test "password should be have a minium length" do
   	  @user.password = @user.password_confirmation = "a" *5
   	  assert_not @user.valid?
   end

    test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
   end

end
