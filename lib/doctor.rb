class Doctor
  attr_reader :name
  @@all = []
  def initialize(name)
    @name = name
    self.class.all << self
  end

  def appointments
    Appointment.all.select { |a| a.doctor == self }
  end

  def patients
    self.appointments.collect { |a| a.patient }
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def self.all
    @@all
  end
end