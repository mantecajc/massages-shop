module ApplicationHelper
  def massages_page?
    (params[:filter] == 'massages') || (@massage && @massage.category.page == 'massages')
  end

  def offers_page?
    (params[:filter] == 'offers') || (@massage && @massage.category.page == 'offers')
  end
end
