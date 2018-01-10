module DefaultPageContent
  extend ActiveSupport::Concern

  included do
  before_action :set_page_default
  end

  def set_page_default
  @page_title = "Devcamp Portolio"
  @seo_keywords = "Monsmith portfolio"
  end
end
