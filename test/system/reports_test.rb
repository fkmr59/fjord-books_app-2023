# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    assert_text 'ログインしました。'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報の一覧'

    assert_text @report.title
    assert_text @report.content

  end

  test 'should create report' do
    visit reports_url
    click_link '日報の新規作成'

    assert_selector 'h1', text: '日報の新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_selector 'h1', text: '日報の詳細'

    assert_text @report.title
    assert_text @report.content

  end

  test 'should update Report' do
    visit report_url(@report)
    click_link 'この日報を編集'

    assert_selector 'h1', text: '日報の編集'

    @re_report = reports(:two)

    fill_in 'タイトル', with: @re_report.title
    fill_in '内容', with: @re_report.content
    click_button '更新する'

    assert_text '日報が更新されました。'

    assert_selector 'h1', text: '日報の詳細'

    assert_text @re_report.title
    assert_text @re_report.content


  end

  test 'should destroy Report' do
    visit report_url(@report)
    click_button 'この日報を削除'
    
    assert_text '日報が削除されました。'

    assert_selector 'h1', text: '日報の一覧'
  end
end
