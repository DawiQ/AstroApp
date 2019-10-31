class JsonWebToken
 class << self
   def encode(payload, exp = 24.hours.from_now)
     payload[:exp] = exp.to_i
     @key = "a80c492beecb0159f031575e94ec4d80348b4d64479eae5e5d67804db6dce9accab874a26154ae2d4e31136729c1fde10458c5da04524fe166b01d1e3b4da21e"
     Rails.logger.info(payload)
     Rails.logger.info(@key)
     JWT.encode(payload, @key)
   end

   def decode(token)
     body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end
 end
end
