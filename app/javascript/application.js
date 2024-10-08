// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

var store_link_status_asc = "jobs?direction=asc&sort=status"
var store_link_status_desc = "jobs?direction=desc&sort=status"
document.addEventListener('turbo:load', function() {
    const categorySelect = document.getElementById("categorySelect");
    const status_asc = document.getElementById("status_asc");
    const status_desc = document.getElementById("status_desc")
    const filter_link = document.getElementById("filter_link")

    document.getElementById("filter_link").setAttribute("href","/jobs?category=" + categorySelect.value)
    if (categorySelect) { // Check if the element exists
        categorySelect.addEventListener('click', function() {
            document.getElementById("filter_link").setAttribute("href","/jobs?only_category=" + categorySelect.value)
        });
    } else {
        console.error("Element with ID 'categorySelect' not found.");
    }
});