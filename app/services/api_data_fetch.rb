require 'webrick/httputils'

class ApiDataFetch

  def initialize()
    @api_url = 'http://dawiq.lh.pl/apis/'
  end

  def call
    response = RestClient.get @api_url, { content_type: :json }
    data = JSON.parse(response.body)

    data.each do |row|
      begin
        date = row["date"].match(/(\w+) (\d+)/)
        month = date[1]
        day = date[2]
        year = Date.current.year
        full_date = Date.strptime("#{month}-#{day}-#{year}", '%b-%e-%Y')

        raise "Missing event name" if row["name"].first.nil?
        raise "Missing type name" if row["type"].first.nil?

        name = row["name"].first
        type_name = row["type"].first


        preference = Preference.find_or_create_by(name: type_name)
        Event.create(date: date, preference_id: preference.id, name: name)
      rescue => e
        Rails.logger.error ("[ApiDataFetch] Failed to import, error: #{e}")
        next
      end
    end
  end

  def self.call(*opts)
    self.new(*opts).call
  end
end
