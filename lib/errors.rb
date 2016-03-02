module UdaciListErrors
  class ErrorName < StandardError
    #if something_bad_happens
    # raise ModuleName::ErrorName, "Scanner Communication Error..."
    # end
  end
  class InvalidItemType < StandardError
  end
  class IndexExceedsListSize < StandardError
  end
  class InvalidPriorityValue < StandardError
  end
end
