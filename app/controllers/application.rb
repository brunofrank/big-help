# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '63a1fdf3cb8d1c2eebe2db04c4abd6e9'
  
  include AuthenticatedSystem
  
  
  def adjust_format_for_phones
    # request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
    request.format = case request.env["HTTP_USER_AGENT"]
    when /iPod|iPhone|Android|Blackberry/i 
      'mobile'
    else
      'html'
    end
  end
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
