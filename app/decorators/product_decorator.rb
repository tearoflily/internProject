# frozen_string_literal: true

module ProductDecorator
  #新規登録時エラーがあった場合の処理
  def errorCheck
    html = ""
    if errors.present?
      html += "<ul class='bg-danger text-white text-center p-2' style:'list-style-tpe:none;'>"
      errors.full_messages.each do |error|
        html += "<li style='text-decoration:none;'>#{error}</li>"
      end
      html += '</ul>'
    end
    return html.html_safe
  end
end
