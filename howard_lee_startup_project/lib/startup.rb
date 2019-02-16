require "employee"

class Startup

	def initialize( name, funding, salaries)
		@name = name 
		@funding = funding
		@salaries = salaries
		@employees = []
	end 

	attr_reader :name, :funding, :salaries, :employees

	def valid_title?(title)
	    @salaries.has_key?(title)
		
	end 

	def > (another_startup)
		self.funding > another_startup.funding 
	end 

	def hire(employee_name, title)
		
        if !valid_title?(title)
        	raise "not a valid title"
        end 
        @employees << Employee.new(employee_name,title)

	end 

	def size
		@employees.length
	end 

	def pay_employee(employee)
		if @funding > @salaries[employee.title]
			employee.pay(@salaries[employee.title])
			@funding -=  @salaries[employee.title]
		else
			raise "not enough money"
		end 
	end 
	 

	def payday
		@employees.each do |employee|
			pay_employee(employee)
		end 
	end 

	def average_salary
		total = 0
		@employees.each do |employee|
			total += @salaries[employee.title] 
		end 
		return total/ @employees.length
	end 

	def close
		@funding = 0
		@employees = []
	end 

	def acquire(another_startup)
		@funding += another_startup.funding 
		another_startup.salaries.each do |title, amount|
			if @salaries.has_key?(title) == false 
				@salaries[title] = amount
			end 
		end 
		@employees += another_startup.employees
		another_startup.close()
	end 


end
