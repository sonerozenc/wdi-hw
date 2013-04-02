# HappiTails App (Homework)
# Objectives:

# COMMENT!

# Practice creating objects
# Activity:

# Students should work on this lab in groups.

# Use Pivotal Tracker to break the project into tasks and assign them to collaborators.
# Use GitHub to collaborate with your team members.
# Prompt: You are the manager at HappiTails animal shelter. You need to do the following:

# Manage the clients coming into the shelter. Track their names, ages, gender, kids and the number of pets they have.
# Manage the animals. Track their names, breed, age, gender and their favorite toys.
# A client will want to come and see the list of available animals to adopt
# A client will want to come in and give up their animal for adoption
# A client will want to list the animals in the shelter
# A client will want to list the clients

# ----------------

class Shelter

  attr_reader :clients, :animals
 
  def initialize
    @clients = {}
    @animals = []
  end

  def run
    puts "Welcome to SHELTER application!"
    select_main_options
  end

  def puts_message(message)
    puts "#{message}"
  end

  def select_main_options
    puts "Please choose one of the following:"
    puts
    puts "(1) I would like to register as a client."
    puts "(2) I would like to see a list of clients."
    puts "(3) I would like to add my animal for adoption."
    puts "(4) I would like to see a list of animals for adoption."
    puts
    puts "(q) Quit."
    puts
  
    case gets.chomp.downcase
    when '1'
      add_client
    when '2'
      show_clients
    when '3'
      add_animal
    when '4'
      show_animals
    when 'q'
      puts_message "Thanks for using our SHELTER application."
      return "See you next time..."
    else
      puts_message "Please read above carefully again and make your choice 1/2/3/4/q."
    end

    select_main_options
  end

  def add_client

    puts "What is your name?"
    c_name = gets.chomp
    
    puts "How old are you? (please enter an integer)"
    age = gets.chomp.to_i
    
    puts "What is your gender?"
    gender = gets.chomp
    
    puts "How many kids do you have? (please enter an integer)"
    num_kids = gets.chomp.to_i
    
    # puts "How many animals do you have? (please enter an integer)"
    # num_animals = gets.chomp.to_i

    options = {}
    options[:age] = age
    options[:gender] = gender
    options[:num_kids] = num_kids
    # options[:num_animals] = num_animals
    options[:num_animals] = 0

    
    client = Client.new(c_name, options)

    if (client)
      @clients[c_name] = client
      puts "Added a new client named #{client.c_name}."    
    else
      puts "Failed to add you as a client. Sorry!"
    end

  end

  def show_clients
    
    if @clients.empty?    
      puts "No clients yet. Enter 1 to add yourself as a client."
    else    
      puts "Client name, Age, Gender, Number of kids, Number of animals"
      puts

      @clients.each do |key, client|
        puts client.c_name + " " + client.age.to_s + " " + client.gender + " " + client.num_kids.to_s + " " + client.num_animals.to_s + "."
      end
    
    end
  
  end

  def add_animal

    keys = @clients.keys

    if keys.empty?
      puts "No clients yet. Enter 1 to add."
    else
      puts "Please choose your name by number:"

      keys.each_index do |i|
        key = keys[i]
        puts "#{i + 1}: #{key}"
      end

      idx = gets.chomp.to_i - 1

      if idx >= 0 and idx < keys.length
        key = keys[idx]
        client = @clients[key]
        
        options = {}
        
        puts "Please enter your animal's name:"
        a_name = gets.chomp
        
        puts "Please enter your animal's breed:"
        options[:breed] = gets.chomp
        
        puts "Please enter your animal's age as an integer:"
        options[:age] = gets.chomp.to_i
        
        puts "Please enter your animal's gender:"
        options[:gender] = gets.chomp
        
        puts "Please enter your animal's favorite toy:"
        options[:fav_toy] = gets.chomp

        options[:client] = client

        animal = Animal.new(a_name, options)

        if animals
          
          client.animals[a_name] = animal


          # options[:num_animals] = 1
          # client[:num_animals] = 1
          # puts key
          # client[:num_animals] = 1
          client.num_animals += 1

          list_animals_by_client(client)
          puts "Added animal named #{a_name} under your name #{client.c_name}"
        else 
          puts "Failed to add new animal! Sorry."
        end

      else
        puts "Sorry I didn't get your name. Please try again."
      end
    end
  end

  def show_animals
    
    keys = @clients.reject { |k,v| v.animals.empty? }.keys

    if keys.empty?
      
      if @clients.empty?
        puts "No clients yet. Enter 1 to add."
      else
        puts "You haven't added any animals yet. Enter 3 to add."
      end
    
    else
      
      puts "Please choose animal owner's name by number:"
      
      keys.each_index do |i|
        key = keys[i]
        puts "#{i + 1}: #{key}"
      end

      idx = gets.chomp.to_i - 1

      if idx >= 0 and idx < keys.length
        
        key = keys[idx]
        
        client = @clients[key]
        
        if client.animals.empty?
          puts "You haven't added any animals yet."
        else
          list_animals_by_client(client)
        end
      
      else      
        puts "Sorry, I didn't recognise that number."
      end

    end

  end

  def list_animals_by_client(client)
    
    puts "#{client.c_name}'s animals:"
    
    puts "Animal name, Breed, Age, Gender, Favourite Toys"

    keys = client.animals.keys.sort
    
    keys.each do |key|
      animal = client.animals[key]
      puts animal.a_name + " " + animal.breed + " " + animal.age.to_s + " " + animal.gender + " " + animal.fav_toy
    end

  end

  class Client
   
    attr_accessor(:c_name, :age, :gender, :num_kids, :num_animals, :animals)
   
    def initialize(c_name, options = {})
      @c_name = c_name
      @age = options[:age]
      @gender = options[:gender]
      @num_kids = options[:num_kids]
      @num_animals = options[:num_animals]
      @animals = options[:animals] || {}
    end

    # def add_animal(animal)
    #   @animals[animal.a_name] = animal
    #   animal.client = self
    # end

    # def remove_animal(animal) 
    #   animal.client = nil
    #   @animals.delete animal.a_name
    # end

    # def remove_all_animals
    #   @animals.each do |animal|
    #     animal.client = nil
    #   end
    #   @animals = {}
    # end
   
    def to_s
      puts c_name
    end
   
  end

  class Animal
   
    attr_accessor(:a_name, :breed, :age, :gender, :fav_toy, :clients)

    def initialize(a_name, options = {})
      @a_name = a_name
      @breed = options[:breed]
      @age = options[:age]
      @gender = options[:gender]
      @fav_toy = options[:fav_toy]
      @clients = options[:clients] || {}
    end

  end

end

r = Shelter.new
r.run
