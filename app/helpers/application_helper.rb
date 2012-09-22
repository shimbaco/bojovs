module ApplicationHelper
  def formated_date(date)
    date.strftime('%Y/%m/%d')
  end

  def formated_datetime(datetime)
    datetime.strftime('%Y/%m/%d %H:%M:%S')
  end
end
