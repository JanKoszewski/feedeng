require 'hashie'
require 'json'
require 'faraday'

module Feedeng
  class Client
    attr_reader :connection
    attr_accessor :token

    def initialize
      @connection = Faraday.new(:url => 'http://api.lvh.me:3000')
    end

    def set_token(token)
       @token = token
    end

    def get_user_feed(feed_name)
      get "/feeds/#{feed_name}"
    end

    def get_user_posts(feed_name)
      get "/feeds/#{feed_name}/posts"
    end

    def post_to_feed(feed_name, params)
      post("/feeds/#{feed_name}/posts", params)
    end

    def refeed(feed_name, feed_item)
      refeed_post("/feeds/#{feed_name}/posts/#{feed_item}/refeeds")
    end

    def blank?(var)
      if var.nil? || var.empty? || var == ' '
        true
      end
    end

    private

    def get(url)
      if blank?(@token)
        response = 'You must set a user token via the \'set_token\' method before using the api'
      else
        resp = connection.get do |req|
          req.url url
          req.headers['Content-Type'] = 'application/json'
          req.headers['TOKEN'] = token
        end

        if resp.status == 401
          resp.status
        else
          JSON.parse(resp.body)
        end
      end
    end

    def post(url, body)
      if blank?(@token)
        response = 'You must set a user token via the \'set_token\' method before using the api'
      else
        resp = connection.post do |req|
          req.url url
          req.headers['Content-Type'] = 'application/json'
          req.headers['TOKEN'] = token
          req.body = body
        end

        if resp.status == 401
          resp.status
        else
          JSON.parse(resp.body)
        end
      end
    end

    def refeed_post(url)
      if blank?(@token)
        response = 'You must set a user token via the \'set_token\' method before using the api'
      else
        resp = connection.post do |req|
          req.url url
          req.headers['Content-Type'] = 'application/json'
          req.headers['TOKEN'] = token
        end

        resp.status
      end
    end

  end
end
