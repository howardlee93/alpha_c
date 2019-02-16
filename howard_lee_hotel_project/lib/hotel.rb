require_relative "room"

class Hotel
  def initialize(name, rooms)
  	@name = name
  	@rooms = {}

  	rooms.each do |room_name, capacity|
  		@rooms[room_name] = Room.new(capacity) 
  	end 
  end 

  def name
  	@name.split(" ").map(&:capitalize).join(" ")
  end 

  def rooms 
  	@rooms
  end 

  def room_exists?(room_name)
  	if @rooms.key?(room_name)
  		return true
  	else 
  		return false 
  	end 
  end 

  def check_in(person, room_name)
  	if room_exists?(room_name)
  		if @rooms[room_name].add_occupant(person)
  			p "Check in successful"
  		else 
  			p "sorry room is full"
        end
  	else 
  		p "sorry, room does not exist"
  	end 

  end 

  def has_vacancy?
  	if @rooms.each_value.all?{|room| room.full?}
  		return false
  	end  
  	return true 
  end 

  def list_rooms
    @rooms.each do |room_name, room|
      puts "#{room_name}.*#{room.available_space}"
    end 

  end 




end
