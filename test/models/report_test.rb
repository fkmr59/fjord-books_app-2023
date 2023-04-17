# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'should report editable?' do
    report = reports(:report_one)
    user = users(:alice)
    assert report.editable?(user)

    user = users(:bob)
    assert_not report.editable?(user)
  end

  test 'should created_on report' do
    report = reports(:report_one)
    assert_equal report.created_at.to_date, report.created_on
  end
end
