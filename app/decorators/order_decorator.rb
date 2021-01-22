# frozen_string_literal: true

module OrderDecorator
  def orderStatusView
    if status == 'in_order'
      return "bg-primary p-1 text-white"
    elsif status == 'processed'
      return "bg-warning p-1 text-white"
    elsif status == 'delivery'
      return "bg-danger p-1 text-white"
    end
  end
  
end
