class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  def details
    "Todo: ".colorize(:green) +  format_description(@description) + "due: " + format_date(due: @due) + format_priority
  end
  def type_name
    "todo"
  end
end
