
module Hotel
  class Loader

    OLDEST_RES_DATE = Date.new(1900, 01, 01)
    NEWEST_RES_DATE = Date.new(3999, 12, 31)

    def validate_date(entry)
      if entry.class == String
        entry = Date.strptime(entry, '%m/%d/%Y')
        if entry.class != Date || entry < OLDEST_RES_DATE || entry > NEWEST_RES_DATE
          raise ArgumentError.new("Invalid date.  Please enter MM/DD/YYYY Received #{entry}")
        end
      elsif entry.class == Date
        if entry < OLDEST_RES_DATE || entry > NEWEST_RES_DATE
          raise ArgumentError.new("Date: Invalid date. Received #{entry}")
        end
      else
        raise ArgumentError.new("Other: Invalid date. Received #{entry}")
      end
      return entry
    end

    def validate_stay(beginning, ending)
      beginning = validate_date(beginning)
      ending = validate_date(ending)
      if beginning > ending
        raise ArgumentError.new("Start date cannot be after end date")
      end
    end






  end # class loader

end # module Hotel
