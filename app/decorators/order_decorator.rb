# frozen_string_literal: true

module OrderDecorator
  def orderStatusView
    if status == 'in_order'
      return "btn btn-primary "
    elsif status == 'processed'
      return "btn btn-warning"
    elsif status == 'delivery'
      return "btn btn-danger"
    end
  end

  def orderStatusDiv
    if status == 'in_order'
      return "bg-primary p-3 text-white "
    elsif status == 'processed'
      return "bg-warning p-3 text-whit"
    elsif status == 'delivery'
      return "bb-danger p-3 text-whit"
    end
  end
  
end
