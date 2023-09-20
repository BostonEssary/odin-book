module ApplicationHelper
    def active_link_to(text = nil, path = nil, **options, &)
        link = block_given? ? text : path
    
        options[:class] = class_names(options[:class], 'text-white bg-gradient-to-r from-pink-400 via-pink-500 to-pink-600 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-pink-300 dark:focus:ring-pink-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center m-1 rounded font-bold') if current_page?(link)
    
        if block_given?
          link_to(link, options, &)
        else
          link_to text, path, options
        end
    end   
end
