# encoding: utf-8

require "rubygems"
require "phidgets-ffi"


Phidgets::RFID.new do |rfid|
  while true do
    rfid.on_tag do |device, tag, obj|
      rfid.led = !rfid.led
      puts "Tag: #{tag}"
    end
    # puts rfid.tag_present()
    sleep 1
  end
end

# rfid = Phidgets::RFID.new
# rfid.wait_for_attachment 2000
#
# while true do
#   rfid.on_tag do |device, tag, obj|
#     rfid.led = !rfid.led
#     puts "Tag: #{tag}"
#   end
#   sleep 1
# end
#
# rfid.close