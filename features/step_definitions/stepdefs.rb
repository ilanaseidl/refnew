module SignUpStepHelper
  def sign_up(email)
    @user = User.new(email: email, counter: 0)
    @user.save
  end
  def counter
    @total = User.all.count
  end
end
World SignUpStepHelper

Given("current user's email") do
  @first_total = counter
  sign_up("email@example.com")
end

When("user successfully sign up") do
  @second_total = counter
end

Then("user appears in the db") do
  assert_equal @second_total, @first_total+1
end