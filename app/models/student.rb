class Student < ActiveRecord::Base
  has_many :picks

  def name
    [first_name, last_name].join(" ")
  end

  def name=(name)
    name_components = name.split
    self.first_name = name_components.first
    self.last_name = name_components.last
  end

  def pick!
    logger.info "PICKING #{name}"
    Pick.create(student_id: id)
  end

  def count
    picks.count
  end

  def self.fairly_pick
    students = Student.all
    lowest_participation = students.map { |s| s.count }.min

    students_on_deck = students.select { |student| student.count == lowest_participation }

    picked_student = students_on_deck.sample

    logger.info "Out of #{students.length}. #{picked_student.name} gets to answer!"

    picked_student.pick!

    picked_student
  end
end
