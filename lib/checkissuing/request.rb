require 'httparty'
require 'json'

module Checkissuing
  class Request
    include HTTParty
    debug_output Checkissuing.debug_output if Checkissuing.debug

    def get(path, options={})
      set_auth(options)
      @response = self.class.get(Checkissuing.endpoint + path, options)
    end

    def post(path, options={})
      set_auth(options)
      @response = self.class.post(Checkissuing.endpoint + path, options)
    end

    def put(path, options={})
      set_auth(options)
      @response = self.class.put(Checkissuing.endpoint + path, options)
    end

    def delete(path, options={})
      set_auth(options)
      @response = self.class.delete(Checkissuing.endpoint + path, options)
    end

    def response
      @response
    end

    def parsed_response
      self.response.parsed_response if self.response.present?
    end

    private

    def set_auth(options)
      options[:body] ||= {}
      options[:body][:akey] ||= Checkissuing.api_key
      options[:body][:client_id] ||= Checkissuing.client_id


      options[:http_proxyaddr] = Checkissuing.proxy_host if Checkissuing.proxy_host.present?
      options[:http_proxyport] = Checkissuing.proxy_port if Checkissuing.proxy_port.present?
      options[:http_proxyuser] = Checkissuing.proxy_user if Checkissuing.proxy_user.present?
      options[:http_proxypass] = Checkissuing.proxy_password if Checkissuing.proxy_user.present?
    end
  end
end
