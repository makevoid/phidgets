path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class RFIDWeb < Sinatra::Base
  include Voidtools::Sinatra::ViewHelpers

  def partial(name, value)
    locals = if value.is_a? Hash
      value
    else
      hash = {}; hash[name] = value
      hash
    end
    haml "_#{name}".to_sym, locals: locals
  end
end

require_all "#{path}/routes"
