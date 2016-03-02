module Listable
  
  def format_description(description)
    "#{description}".ljust(30)
  end
  def format_date(options ={})
    if options[:due] then
        dates = options[:due].strftime("%D")
      elsif options[:start_date]
        dates = options[:start_date].strftime("%D") 
        if options[:end_date] then
          dates << " -- " + options[:end_date].strftime("%D")
        end
      else
        dates = "N/A"
    end
    return dates
  end
  def format_priority
    if @priority == "high" then
      value = " ⇧".colorize(:red) 
    elsif @priority == "medium"
      value = " ⇨".colorize(:yellow)
    elsif @priority == "low"
      value = " ⇩".colorize(:green) 
    elsif !@priority
      value = "" 
    else
      raise UdaciListErrors::InvalidPriorityValue, "Not a valid priority level!"
    end
    return value
  end
  
end
