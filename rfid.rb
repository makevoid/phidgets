# encoding: utf-8

require "rubygems"
require "phidgets-ffi"


Phidgets::RFID.new do |rfid|

  while true do

    rfid.on_tag do |device, tag, obj|
      rfid.led = !rfid.led if tag.join == "0107c3b1b8"
      puts "#{tag.join}"
    end

    rfid.on_tag_lost do |device, tag, obj|
      puts "Tag lost: #{tag.join}"
    end

    sleep 1
  end

end

