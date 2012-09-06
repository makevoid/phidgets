# encoding: utf-8

require "rubygems"
require "phidgets-ffi"


Phidgets::RFID.new do |rfid|

  while true do

    rfid.on_tag do |device, tag, obj|
      puts "#{tag.join}"
      rfid.led = !rfid.led
    end

    rfid.on_tag_lost do |device, tag, obj|
      puts "Tag lost: #{tag.join}"
      # rfid.led = true
      # sleep 1
      # rfid.led = false
    end

    sleep 1
  end

end

