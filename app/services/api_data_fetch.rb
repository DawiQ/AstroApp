require 'webrick/httputils'

class ApiDataFetch

  def initialize()
    @api_url = 'http://dawiq.lh.pl/apis/'
    @latitude = 51.759
    @longitude = 19.457

    Event.destroy_all
  end

  def call
    response = RestClient.get @api_url, { content_type: :json }
    data = JSON.parse(response.body)

    data.each do |row|
      begin
        date = Date.strptime("#{row["date"]}", '%d-%m-%Y').to_s
        event_starts = nil

        Time.use_zone("Europe/Berlin") do
          sun_times = SunTimes.new
          event_starts = sun_times.set(Time.zone.parse(date), @latitude, @longitude) + 3.hours
        end

        raise "Missing event name" if row["name"].first.nil?
        raise "Missing type name" if row["type"].first.nil?

        name = row["name"].first
        type_name = row["type"].first


        preference = Preference.find_or_create_by(name: type_name)
        Event.create(date: event_starts, preference_id: preference.id, name: name)
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
