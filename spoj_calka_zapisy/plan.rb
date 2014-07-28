class Plan
	attr_accessor :classes
	attr_accessor :plan_hour_starts, :plan_hour_ends
	def initialize(plan_hour_starts, plan_hour_ends)
		@plan_hour_starts = plan_hour_starts.to_i
		@plan_hour_ends = plan_hour_ends.to_i
	  	@list_of_classes = Array.new
	  	#@list_of_classes[(plan_hour_starts-1..plan_hour_ends-1)] = false
	end

	def adding_hour_classes(object_classes)
		if hour_classes_valid?(object_classes, self)
			while object_classes.classes_start_hour-1<object_classes.classes_end_hour-1
				@list_of_classes[object_classes.classes_start_hour-1]="#{object_classes.name_of_classes}"
				object_classes.classes_start_hour+=1
			end
		else
			raise "This hours are taken"
		end
	end

	def hour_classes_valid?(object_classes, plan_obj)
		starting = object_classes.classes_start_hour-1
		ending = object_classes.classes_end_hour-1
		if object_classes.classes_start_hour<plan_obj.plan_hour_starts or object_classes.classes_end_hour>plan_obj.plan_hour_ends
			result = false
		else
			while starting<ending
					if @list_of_classes[starting]!=nil
						puts "#{@list_of_classes[ending]}"
						break
						result = false
					end
					starting+=1
					result = true
			end
		end
		result
	end

	def adding_duration_classes(object_classes)
		free_hours = 0
		starts = self.plan_hour_starts-1
		ends = self.plan_hour_ends-1
		ending_index = self.plan_hour_ends-1
		result = Array.new

		while ends>starts and free_hours<object_classes.duration_hours
			if @list_of_classes[ends]== nil
				free_hours+=1
				ends -=1
			else
				free_hours=0
				ending_index = ends
				ends -=1
			end
		end
		starting_index = ending_index-free_hours

		if free_hours==object_classes.duration_hours
			while starting_index<ending_index
				@list_of_classes[starting_index]="#{object_classes.name_of_classes}"
				starting_index +=1
			end
		else
			raise "You cannot add such long classes"
		end
	end

	def printing_day_plan
		@list_of_classes.each_index do |iterator|
			unless @list_of_classes[iterator]==nil
				puts "#{iterator +=1} #{@list_of_classes[iterator-1]}"
			end
		end
	end
end

class Classes < Plan
	attr_accessor :plan
	attr_accessor :duration_hours
	attr_accessor :classes_end_hour
	attr_accessor :classes_start_hour
	attr_accessor :name_of_classes
	def initialize(*args)
		case args.size
		when 3
			init_with_start_end(*args)
		when 2
			init_with_duration(*args)
		else
			error
		end
	end

	def init_with_start_end(name_of_classes, classes_start_hour, classes_end_hour)
		if true #is_hour_classes_valid?
			@name_of_classes, @classes_start_hour, @classes_end_hour = name_of_classes, classes_start_hour.to_i, classes_end_hour.to_i
		else
			error
		end
	end

	def init_with_duration(name_of_classes, duration_hours)
		if true #is_hour_classes_valid?
			@name_of_classes, @duration_hours = name_of_classes, duration_hours.to_i
		else
			error
		end
	end

	def printing_classes
		if duration_hours
			puts "#{self.name_of_classes}:\nDuration :#{self.duration_hours}"
		else
			puts "#{self.name_of_classes}:\nStarting hour:#{self.classes_start_hour}   Ending hour:#{self.classes_end_hour}"
		end
	end
end

dzien1 = Plan.new(7,21)
puts "#{dzien1.plan_hour_starts} - #{dzien1.plan_hour_ends}"
matematyka = Classes.new('matematyka', 5)
polski = Classes.new('polski', 10,13)
angielski = Classes.new('angielski', 13,15)
dzien1.adding_hour_classes(polski)
dzien1.adding_hour_classes(angielski)
dzien1.adding_duration_classes(matematyka)
dzien1.printing_day_plan



