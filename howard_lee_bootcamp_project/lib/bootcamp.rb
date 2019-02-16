class Bootcamp


	def initialize(name, slogan,  student_capacity)
		@name = name
		@slogan = slogan
		@student_capacity = student_capacity
		@teachers = []
		@students = []
		@grades = Hash.new { |h, k| h[k] = [] }

	end 

	def name 
		@name
	end 

	def slogan
		@slogan
	end 

	def student_capacity
		@student_capacity
	end 

	def teachers 
		@teachers
	end 

	def students 
		@students
	end 

	def hire(instructor)
		@teachers << instructor
	end 

	def enroll(student)
		if students.length < @student_capacity
			@students << student 
			return true
			end
		false  
	end 

	def student_to_teacher_ratio
		return @students.length/ @teachers.length
	end 


	def enrolled?(student)
		@students.include?(student)
	end 

	def add_grade(student, grade)
		if enrolled?(student)
			@grades[student] << grade
			return true 
		end 
		return false 
	end 

	def num_grades(student)
		@grades[student].length 
	end 
	def average_grade(student)
		if enrolled?(student) 
			if @grades.key?(student) 
				@grades[student].reduce{|total_grade, grade| (total_grade +grade)/ num_grades(student) }
			end 

		end 
	end 




end
