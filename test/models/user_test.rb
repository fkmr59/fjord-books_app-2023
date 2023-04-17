# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should user_email' do
    user = users(:alice)
    assert_equal 'alice@example.com', user.name_or_email
  end

  test 'should user_name' do
    user = users(:bob)
    assert_equal 'ボブ', user.name_or_email
  end
end
