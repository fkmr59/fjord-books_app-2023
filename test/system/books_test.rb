# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)

    visit books_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    assert_text 'ログインしました。'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本の一覧'

    assert_text @book.title
    assert_text @book.memo
    assert_text @book.author
  end

  test 'should create book' do
    visit books_url
    click_link '本の新規作成'

    assert_selector 'h1', text: '本の新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'Rubyの習い初めに'
    fill_in '著者', with: 'igaiga'
    click_button '登録する'

    assert_text '本が作成されました。'
    assert_selector 'h1', text: '本の詳細'

    assert_text 'Ruby超入門'
    assert_text 'Rubyの習い初めに'
    assert_text 'igaiga'
  end

  test 'should update Book' do
    visit book_url(@book)
    click_on 'この本を編集'

    assert_selector 'h1', text: '本の編集'

    @re_book = books(:two)

    fill_in 'タイトル', with: @re_book.title
    fill_in 'メモ', with: @re_book.memo
    fill_in '著者', with: @re_book.author

    click_button '更新する'

    assert_text '本が更新されました。'

    assert_selector 'h1', text: '本の詳細'

    assert_text @re_book.title
    assert_text @re_book.memo
    assert_text @re_book.author
  end

  test 'should destroy Book' do
    visit book_url(@book)
    click_button 'この本を削除'

    assert_text '本が削除されました。'

    assert_selector 'h1', text: '本の一覧'
  end
end
