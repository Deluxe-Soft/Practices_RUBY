class Library
	include Renting

	attr_accessor :book
	attr_accessor :books
	attr_accessor :newauthor
	attr_reader :library_name
	attr_accessor :customers
	attr_accessor :rentedbooks

	def initialize(library_name)
		@library_name = library_name
		@books = Array.new
		@authors =Array.new
		@publishers = Array.new
		@customers = Array.new
		@rentedbooks = Array.new
	end

	def add_customer(name, surname, pesel, city, street_name, number)
		newcustomer = Customer.new(name, surname, pesel, city, street_name, number)
		@customers <<newcustomer
		newcustomer
	end

	def add_publisher(publisher_name)
		newpublisher = Publisher.new(publisher_name)
		@publishers << newpublisher
		newpublisher
	end

	def add_author(name, surname, year_of_birth)
		newauthor = Author.new(name, surname, year_of_birth)
		@authors << newauthor
		newauthor
	end


	def add_book(title, authors_name, authors_surname, authors_year_of_birth, publisher_name)
		current_book = @books.find {|book| book.title == title and book.author.surname == authors_surname and book.publisher.publisher_name ==publisher_name}
	    if current_book
	      current_book.increment_number_of_books
	    else
	      book = Book.new(title)

	      current_author = @authors.find {|auth| auth.name == authors_name and auth.surname == authors_surname and auth.year_of_birth==authors_year_of_birth}
		  if current_author
			book.add_author(current_author)
	      else
	      	newauthor =self.add_author(authors_name, authors_surname, authors_year_of_birth)
	      	newauthor.add_book(book).class
	      	book.add_author(newauthor)
	      end

	      current_publisher = @publishers.find {|pub| pub.publisher_name == publisher_name}
	      if current_publisher
	      	book.add_publisher(current_publisher)
	      else
	      	newpublisher = self.add_publisher(publisher_name)
	      	newpublisher.add_book(book)
	      	newpublisher.add_author(newauthor)
	      	book.add_publisher(newpublisher)
	      end

	      @books<<book
	    end
	end

	def print_library
		puts "Nazwa:#{self.library_name}\nKsiążki:#{self.books}\nKlienci:#{self.customers}"
	end

end

class Book < Library

	attr_accessor :author
	attr_accessor :publisher
	attr_accessor :number_of_books
	attr_accessor :title
	attr_accessor :number_of_availabale

	def initialize(title)
		@number_of_books = 1
		@number_of_availabale = 1
		@title = title
		@author = author
		@publisher = publisher
	end

	def increment_number_of_books
    	@number_of_books += 1
    	@number_of_availabale +=1
  	end

  	def add_author(author)
  		@author = author	
  	end

  	def add_publisher(publisher)
  		@publisher = publisher
  	end

  	def print_books
  		puts "Tytuł:#{self.title}, Autor:#{self.print_author}, Wydawca:#{self.print_publisher}, Liczba Książek:#{self.number_of_books}"
  	end

end

class Publisher < Library

	attr_accessor :books
	attr_accessor :authors
	attr_accessor :description
	attr_accessor :publisher_name

	def initialize(publisher_name)
		@publisher_name = publisher_name
		@books = Array.new
		@authors = Array.new
	end

	def add_book(book)
		@books << book
	end

	def add_author(author)
		@authors << author
	end

	def print_publisher
		puts "#{self.publisher_name},Książki:#{self.print_books},Autorzy:#{"self.print_author"}"
	end

end

class Author < Library

	attr_accessor :books
	attr_accessor :biography
	attr_accessor :author
	attr_accessor :name, :surname, :year_of_birth

	def initialize(name, surname, year_of_birth)
		@name = name
		@surname = surname
		@year_of_birth = year_of_birth
		@books = Array.new
	end


	def add_book(book)
		@books << book
	end

	def print_author
		puts "#{self.surname} #{self.name},urodzony:#{self.year_of_birth}. Książki#{self.print_books}"
	end

end

class Customer 

	attr_accessor :name, :surname, :pesel, :adress, :list_of_rented_books

	def initialize(name, surname, pesel, city, street_name, number)
		@name = name
		@surname = surname
		@pesel = pesel
		@adress = [city, street_name, number]
		@list_of_rented_books = Array.new
	end
	
end

module Renting 

	def check_if_available_book(title, authors_surname)
		book_arr = self.books.select {|book| book.title == title and book.author.surname == authors_surname}
		unless book_arr.empty?
			book = book_arr[0]
			if book.number_of_availabale>0
				book
			else
				raise "Obecnie wszystkie zostały wypożyczone"
			end
		else
			raise "Nie mamy takiej książki"
		end
		book
	end

	def check_if_available_customer(name, surname)
		customer_arr = self.customers.select {|customer| customer.name == name and customer.surname == surname}
		unless customer.empty?
			customer= customer_arr[0]
		else
			raise "Nie ma takiego klienta"
		end
		customer
	end

	def rent_book(title, authors_surname, name, surname)
		book_valid = self.check_if_available_book(title, authors_surname)
		customer_valid = self.check_if_available_customer(name, surname)
		book_valid.number_of_availabale -=1
		self.rentedbooks << book_valid
		customer = self.customers.find {|cust| cust==customer_valid}
		customer.list_of_rented_books<<book_valid

	end

	def give_back(title, authors_surname, name, surname)
		customer_valid = self.check_if_available_customer(name, surname)
		book_valid = self.check_if_available_book(title, authors_surname)
		customer = self.customers.find {|cust| cust==customer_valid}
		customer.list_of_rented_books.delete(book_valid)
		self.rentedbooks.delete(book_valid)
		book_valid.number_of_availabale +=1
	end
end

lib1 = Library.new('Halinka')
lib1.add_publisher('halinkapublisher')
lib1.add_author('Patryk', 'Mikolajczyk', 1992)
lib1.add_book('Skoczne pyrzgody', 'Patryk', 'Edward', 1992, 'Moze')
lib1.add_book('Skoczne pyrzgody', 'Patryk', 'Edward', 1992, 'Moze')
lib1.add_customer('Edward', 'Edwardowicz', 92081005632, 'wro', 'slo', '1')
lib1.print_library