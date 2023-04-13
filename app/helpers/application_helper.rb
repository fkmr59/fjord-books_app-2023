# frozen_string_literal: true

module ApplicationHelper
  # localeに応じて複数形の表記を変える
  # - 日本語の場合 => 本
  # - 英語の場合 => books
  def i18n_pluralize(word)
    I18n.locale == :ja ? word : word.pluralize
  end

  # localeに応じてエラー件数の表記を変える
  # - 日本語の場合 => 3件のエラー
  # - 英語の場合 => 3 errors
  def i18n_error_count(count)
    I18n.locale == :ja ? "#{count}件の#{t('views.common.error')}" : pluralize(count, t('views.common.error'))
  end

  def format_content(content)
    safe_join(content.split("\n"), tag.br)
  end

  def autolink_with_title(content)
    uri_reg = URI::DEFAULT_PARSER.make_regexp(%w[http https])
    content.gsub(uri_reg) do |url|
      begin
        uri_path = URI.parse(url).path.split('/')
        case uri_path[1]
        when 'books'
          book = Book.where(id: uri_path[2]).select(:title).first
          book ? %(<a href="#{url}" target="_blank">#{book.title}</a>) : url
        when 'reports'
          report = Report.where(id: uri_path[2]).select(:title).first
          report ? %(<a href="#{url}" target="_blank">#{report.title}</a>) : url
        else
          url
        end
      rescue
        url
      end
    end.html_safe
  end
end
