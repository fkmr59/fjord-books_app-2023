# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:book_one)
    visit root_url
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

    fill_in 'タイトル', with: @book.title
    fill_in 'メモ', with: @book.memo
    fill_in '著者', with: @book.author
    click_button '登録する'

    assert_text '本が作成されました。'
    assert_selector 'h1', text: '本の詳細'

    assert_text @book.title
    assert_text @book.memo
    assert_text @book.author
  end

  test 'should update Book' do
    visit book_url(@book)
    click_link 'この本を編集'

    assert_selector 'h1', text: '本の編集'

    @re_book = books(:book_two)

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

    assert_not Book.exists?(@book.id)
  end
end
