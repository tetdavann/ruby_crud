module ApplicationHelper
	def category_selector(form)
    form.select :category_id, Category.all.collect { |c| [c.name, c.id] }
  end
end
