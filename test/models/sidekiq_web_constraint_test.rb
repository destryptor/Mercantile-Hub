require "test_helper"

class SidekiqWebConstraintTest < ActiveSupport::TestCase
  test "allows admin sessions" do
    request = ActionDispatch::TestRequest.create
    request.cookie_jar.signed[:session_id] = users(:admin).sessions.create!.id

    assert SidekiqWebConstraint.new.matches?(request)
  end

  test "rejects non admin sessions" do
    request = ActionDispatch::TestRequest.create
    request.cookie_jar.signed[:session_id] = users(:one).sessions.create!.id

    refute SidekiqWebConstraint.new.matches?(request)
  end

  test "rejects missing session cookie" do
    request = ActionDispatch::TestRequest.create

    refute SidekiqWebConstraint.new.matches?(request)
  end
end