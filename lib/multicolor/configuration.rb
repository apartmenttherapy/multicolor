module Multicolor
  class Configuration
    attr_accessor :timeout, :open_timeout, :username, :password, :company

    def valid?
      # TODO
      # are username, company, password set?
    end

    def authenticate?
      true
    end

    def timeout
      @timeout || 40
    end

    def open_timeout
      @open_timeout || 40
    end
  end
end
