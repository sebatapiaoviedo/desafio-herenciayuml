class Appointment
    attr_accessor :location, :purpose, :hour, :min
    def initialize(location, purpose, hour, min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Appointment
    attr_accessor :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        @day = day
    end
    def occurs_on?(day)
        @day == day
    end
    def to_s
        puts "Reunion mensual en #{@location} sobre #{@purpose} el dia #{@day} a la(s) #{@hour}:#{@min}"
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        @hour == hour && @min == min
    end
    def to_s
        puts "Reunión diaria en #{@location} sobre #{purpose} a la(s) #{@hour}:#{@min}"
    end
end

class OneTimeAppointment < Appointment
    attr_accessor :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        @day = day
        @month = month
        @year = year
    end
    def occurs_on?(day, month, year)
        @day == day && @month == month && @year == year
    end
    def to_s
        puts "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
    end
end

puts OneTimeAppointment.new('Universidad San Sebastián', 'Prueba final', 13, 00, 1, 2, 2020).to_s
puts DailyAppointment.new('Seguros Falabella', 'Recaudación', 9, 30).to_s
puts MonthlyAppointment.new('Piso 13', 'Nuevos productos', 9, 30, 31).to_s