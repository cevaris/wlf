module EventsHelper
  def parse_datetime(date)
    begin
      Date.strptime(date,'%m/%d/%Y %I:%M %p')
    rescue
      date
    end
  end
end
