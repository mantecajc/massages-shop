module MassagesHelper
	def get_category_page(url)
		url.include?("offers") ? "offers" : "massages"
	end
end