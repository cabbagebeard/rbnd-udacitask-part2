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
  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
