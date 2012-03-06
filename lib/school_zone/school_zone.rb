module SchoolZone
  class Interval

    attr_reader   :epoch, :interval, :rate
    attr_accessor :checkpoint

    def initialize interval, unit, rate = 1
      @interval = normalize interval, unit
      @rate  = rate
      @epoch = now
    end

    def normalize interval, unit
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

    def now
      Time.now
    end

    def elapsed
      now - epoch
    end

    def relative_interval
      interval - elapsed
    end

    def offset iterator
      (relative_interval / (rate - iterator)) - (now - checkpoint)
    end

    def adjust iterator
      offset = offset iterator
      sleep offset unless offset < 0
    end

  end
end


    # %w[./school_zone benchmark].each {|l| require l}
    # Benchmark.measure {
    #   interval = SchoolZone::Interval.new 5, :seconds, 10 ** 5
    #   interval.rate.times do |i|
    #     interval.checkpoint = Time.now
    #     interval.adjust i
    #   end
    # }