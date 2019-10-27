require 'rake'

namespace :astro do
  task :fetch_from_api => :environment do
    ApiDataFetch.call()
  end
end
