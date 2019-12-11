module SignUpStepHelper
  def sign_up(email)
    @user = User.new(email: email, counter: 0)
    @user.save
  end
end
World SignUpStepHelper

Given("current user's email") do
  sign_up("email@example.com")
end

When("user successfully sign up") do
  @actual_answer = User.find_by(email: @email).present?
end

Then("user appears in the db}") do
  assert_equal @actual_answer, 'true'
end