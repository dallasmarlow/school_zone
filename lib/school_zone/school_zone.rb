module SchoolZone

  def self.interval interval, unit
    case unit
    when :mhz, :megahertz    then interval.to_f / 10 ** 6
    when :khz, :kilohertz    then interval.to_f / 10 ** 3    
    when :hz,  :hertz        then interval
    when :s,   :sec,  :secs, :second, :seconds then interval
    when :m,   :min,  :mins, :minute, :minutes then interval * 60
    when :h,   :hr,   :hrs,  :hour,   :hours   then interval * 3600
    when :d,   :day,  :days  then interval * 86400
    when :w,   :week, :weeks then interval * 604800
    else raise "unsupported unit of time: #{unit}"
    end
  end

end