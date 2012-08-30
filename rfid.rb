# encoding: utf-8

require "rubygems"
require "phidgets-ffi"


Phidgets::RFID.new do |rfid|

  while true do
    rfid.on_tag do |device, tag, obj|
      rfid.led = !rfid.led
      puts "Tag: #{tag}"
    end

    rfid.on_tag_lost do |device, tag, obj|
      puts "Tag lost: #{tag}"
    end

    sleep 1
  end

end