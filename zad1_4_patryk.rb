class Library

	attr_accessor :book
	attr_accessor :books
	attr_accessor :newauthor
	attr_reader :library_name

	def initialize(library_name)
		@library_name = library_name
		@books = Array.new
		@authors =Array.new
		@publishers = Array.new
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
		puts "Nazwa:#{self.library_name},Książki:#{self.books}"
	end

end

class Book < Library

	attr_accessor :author
	attr_accessor :publisher
	attr_accessor :number_of_books
	attr_accessor :title
	attr_accessor :book_id
	attr_accessor :rented

	def initialize(title)
		@number_of_books = 1
		@title = title
		@author = author
		@publisher = publisher
		@book_id +=1
		@rented = false
	end

	def increment_number_of_books
    	@number_of_books += 1
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

module Wypozyczenia 


end

lib1 = Library.new('Halinka')
lib1.add_publisher('halinkapublisher')
lib1.add_author('Patryk', 'Mikolajczyk', 1992)
lib1.add_book('Skoczne pyrzgody', 'Patryk', 'Edward', 1992, 'Moze')
lib1.add_book('Skoczne pyrzgody', 'Patryk', 'Edward', 1992, 'Moze')
lib1.print_library
#(title, authors_name, authors_surname, authors_year_of_birth, publisher_name)