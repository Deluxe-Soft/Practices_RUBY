
class Classes
  attr_accessor :hour, :people, :name
  attr_accessor :classroom

  @@classes_instances = Array.new
  @@classes_count = 0

  def initialize (hour, surname, name)
    @name=name
    @hour=hour
    @people = Array.new
    @people <<surname
    @@classes_instances << self
    @@classes_count +=1
  end

  def add_classroom(classroom)
    @classroom = classroom
  end

  def add_person(surname)
    self.people << surname
  end

  def remove_person(surname)
    self.people.delete(surname)
  end

end

#każde zajęcia mają listę na której znajdują się osoba, godzina

class Classroom

  attr_accessor :classroom_id
  attr_accessor :classes

  @@classroom_instances = Array.new
  @@classroom_count = 0

  def initialize (classroom_id, c)
    @classroom_id=classroom_id
    @classes = Array.new
    @classes << c
    @@classroom_instances << self
    @@classroom_count +=1
    raise if @classes.empty?

  end

  def add_classes(classes)
    @classes<<classes
  end


  def remove_classes(classes)
      @classes.delete(classes)
  end
end


class Admin
  attr_accessor :classes, :classroom
   #TODO are classrooms valid
  def are_classrooms_valid?
    classes.classes_instances.all? do |iterator|
      iterator.include?(classroom)
    end
  end

  def is_class_valid?(classroom_obj) #obiekty SALA
    Classes.@@classroom_instances.all? do |c|
      if classroom_obj.classroom_id==c.classroom_id and classroom_obj.classes==c.classes
        classroom_obj.hour!=c.hour
      end
    end
  end

  def is_hour_valid?(classes_obj, surname) #class classes object + surname
    @@classes_instances.all do |c|
      c.people.include?(surname)
      classes_obj.hour != c.hour and classes_obj.id!=c.id
    end
  end


end

zajecia1 = Classes.new(13,'Mateja','Matematyka')
zajecia2 = Classes.new(15, 'Edwardowicz', 'Polski')
zajecia1.add_person('Mikolajczyk')
zajecia1.add_person('Bednarek')
sala1= Classroom.new(110,zajecia1)
sala1.add_classes(zajecia2)
puts "\n #{sala1.classes}"







