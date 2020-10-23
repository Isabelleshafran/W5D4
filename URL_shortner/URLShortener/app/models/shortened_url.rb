require 'securerandom'

class ShortenedUrl < ApplicationRecord 
    include SecureRandom

    validates :long_url, :user_id, presence: true
    validates :short_url, presence: true, uniqueness: true

    def self.random_code
        short = SecureRandom.urlsafe_base64
        until short.exists?
            short = SecureRandom.urlsafe_base64
        end
        return short
    end # outputs random short url

    def self.make_short_urls(user_obj, long_url)
        self.new(long_url,ShortenedUrl.random_code, user_obj.id)
    end
end   
   