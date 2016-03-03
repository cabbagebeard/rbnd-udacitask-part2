class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    if type == "todo" then 
      @items.push TodoItem.new(description, options) 
    elsif type == "event" 
      @items.push EventItem.new(description, options) 
    elsif type == "link" 
      @items.push LinkItem.new(description, options)
    else 
      raise UdaciListErrors::InvalidItemType, "Not a valid type of list!"
    end
  end
  def delete(index)
    @items.delete_at(index - 1)
    if index >= @items.length then
      raise UdaciListErrors::IndexExceedsListSize, "That item number does not exist!"
    end
  end
  def delete_by_type(type)
    @items.delete_if { |item| item.type_name == type }
    puts "All #{type}s deleted".colorize(:red)
  end
  def all
    table = tablify(@items)
    table.title = @title
    puts table
  end
  
  def filter(type)
    filtered =  @items.select { |item| item.type_name == type }
    table = tablify(filtered)
    table.title = "#{type.capitalize} List"
    puts table
  end
  def tablify(items)
    rows = []
    items.each_with_index do |item, position|
      rows << [position + 1, item.details]
    end
    Terminal::Table.new :rows => rows
  end
end
