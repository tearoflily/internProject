# frozen_string_literal: true

module ItemDecorator
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

  #画像表示時サイズリサイズ
  def thumbnail
    return self.image.variant(resize: '300x300').processed
  end
  
  


      
end
