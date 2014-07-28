
class Classes
  include ObjectSpace

  attr_accessor :hour, :people, :name
  attr_accessor :classroom
  def initialize (hour, surname, name)
    @name=name
    @hour=hour
    @people = Array.new
    @people <<surname
  end

  def add_classroom(classroom)
    @classroom = classroom
  end

  def remove_classroom(classroom)
    @classroom = nil
  end

  def add_person(surname)
    self.people << surname
  end

  def remove_person(surname)
    self.people.delete(surname)
  end

  def is_person_already_added?(surname)
    if self.people.include?(surname)
      raise "This person is already added to this classes"
    end
  end

  def is_hour_valid?(surname) 
    ObjectSpace.each_object(Classes) do |c|
      if c.people.include?(surname)
        if self.hour != c.hour or self.id!=c.id
          puts "Można się zapisać"
        else 
          raise "ERRORY zapisane już są chopki"
        end
      end
    end
  end

  def self.do_all_classes_have_clasrooms?
    ObjectSpace.each_object(self) do |iterator|
      if iterator.classroom==nil
        raise "Nie wszystkie zajęcia mają przypisane sale"
      end
    end
  end

end


class Classroom
  include ObjectSpace

  attr_accessor :classroom_id
  attr_accessor :classes
  def initialize (classroom_id, c)
    @classroom_id=classroom_id
    @classes = Array.new
    @classes << c
    c.add_classroom(classroom_id)
    raise if @classes.empty?
  end

  def add_classes(classes)
    @classes<<classes
    classes.add_classroom(self)
  end


  def remove_classes(classes)
    @classes.delete(classes)
    classes.remove_classroom(self)
  end

  def self.is_class_valid? #obiekty SALA
    list = Array.new
    ObjectSpace.each_object(Classroom) do |c|
        if c.classes.size>1
          c.classes.each do |x|
            list <<x.hour
          end
        end
      end
      raise "errory nie valid bum" unless (list.uniq!)==nil

  end


end


zajecia1 = Classes.new(13,'Mateja','Matematyka')
zajecia2 = Classes.new(15, 'Edwardowicz', 'Polski')
zajecia3 = Classes.new(13, 'Luzak', 'Chinski')
zajecia1.add_person('Mikolajczyk')
zajecia1.add_person('Bednarek')
sala1= Classroom.new(110,zajecia1)
sala2= Classroom.new(111,zajecia3)
sala1.add_classes(zajecia2)
puts "#{zajecia1.classroom}"
puts "#{zajecia3.classroom}"
zajecia1.is_hour_valid?('Edwardowicz')
Classes.do_all_classes_have_clasrooms?
Classroom.is_class_valid?










