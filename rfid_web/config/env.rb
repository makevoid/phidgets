path = File.expand_path '../../', __FILE__
APP = "phidgets"

require "bundler/setup"
Bundler.require :default
module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

env = ENV["RACK_ENV"] || "development"
# DataMapper.setup :default, "mysql://localhost/phidgets_#{env}"
DataMapper.setup :default, adapter: "in_memory"

require_all "#{path}/models"
DataMapper.finalize


# datas (in-memory)

USERS = [
  { username: "Mario",    card_id: "0107c3b1b8" },
  { username: "Luigi",    card_id: "0107c39c9d" },
  { username: "Antonio",  card_id: "0107c3a8f2" },
  { username: "Piero",    card_id: "01069351ed" },
  { username: "Tizio",    card_id: "01068dcd1e" },
  { username: "Caio",     card_id: "01068ddb85" },
  { username: "Antani",   card_id: "0106934275" },
  { username: "Sblinda",  card_id: "01068dc6a8" }
]

USERS.each do |user|
  User.create user
end
