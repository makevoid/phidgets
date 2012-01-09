# encoding: utf-8

require "rubygems"
require "phidgets-ffi"


class Fixnum
  def to_hum
    self.to_f * 0.22222 - 61.11
  end
  
  def to_temp
    self.to_f * 0.22222 - 61.11
  end
  
  def to_lumen
    # TODO: precision light sensor
  end
end

Phidgets::InterfaceKit.new do |ifkit|
  while true do
    ifkit.on_sensor_change do |device, input, value, obj|
      puts "Sensor #{input.index}'s value has changed to #{value}"
    end
    # puts "Serial number: #{ifkit.serial_number}"
    puts "Sensor value[0]: #{ifkit.sensors[0].value.to_hum}"
    puts "Sensor value[1]: #{ifkit.sensors[1].value.to_temp}"
  
    sleep 3
  end

end