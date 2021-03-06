module ApplicationHelper

    # methods will be available in all of the views
    # Returns the full title on a per-page basis
    def full_title(page_title = '') #method def, optional argument
        base_title = "Ruby on Rails Tutorial Sample App" #variable assignment
        if page_title.empty? #boolean test (true or false)
            base_title
        else
            page_title + " | " + base_title #string concatenation
            end

    end
end
