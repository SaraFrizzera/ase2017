
# Restituisce una stringa che dice "Benvenuto"
def welcome_message
  'Benvenuto'
end

# Restituisce n! (fattoriale)
def factorial(n)
  (1..n).inject(:*) || 1
end

# Restituisce la stringa più lunga in un array di stringhe
def find_longest_string(array)
  array.max_by(&:length)
end

# Restituisce true se l'array contiene altri array (es. [[1],2,3] => true)
def has_nested_array?(array)
  array.each do |element|
    return true if element.is_a?(Array)
  end
  false
end

# Conta il numero di caratteri maiuscoli in una stringa
def count_upcased_letters(string)
  string.scan(/[A-Z]/).length
end

# Associazione valori romani - decimali
ROMAN_NUMBERS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
}

# Conversione da decimale a numero romano
def to_roman(n)
  ROMAN_NUMBERS.map do |ltr, val|
    amt, n = n.divmod(val)
    ltr * amt
  end.join
end

class Point2D
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # 
  def +(other)
    Point2D.new(@x + other.x, @y + other.y)
  end

  # Restituisce una rappresentazione testuale dell'oggetto punto, nella forma
  # "(x,y)", senza spazi.
  def to_s
    "(#{@x},#{@y})"
  end
end

require 'date'

class Book
  attr_accessor :title, :author, :release_date, :publisher, :isbn
  
  def initialize(title:, author:, release_date:, publisher:, isbn:)
    @title = title
    @author = author
    @release_date = release_date
    @publisher = publisher
    @isbn = isbn
  end

  # requisiti perche' un libro sia considerato valido:
  # title deve essere una stringa (@title.class == String) non vuota
  # author deve essere una stringa non vuota
  # release_date deve essere un oggetto Date
  # publisher deve essere una stringa non vuota
  # isbn deve essere un Fixnum minore di 10**10 e maggiore di 10**9
  def valid?
    errors.empty?
  end

  # restituisce un array di simboli.
  # Se l'oggetto e' valido, restituisce un vettore vuoto
  # Se non lo e', per ogni attributo che non e' valido, la chiave per
  # quell'attributo deve essere presente nel vettore, in qualsiasi ordine.
  # esempio: title e author non sono validi, restituisce [:title, :author]
  def errors
    result = []
    result.push(:title) unless valid_string? @title
    result.push(:author) unless valid_string? @author
    result.push(:release_date) unless valid_date? @release_date
    result.push(:publisher) unless valid_string? @publisher
    result.push(:isbn) unless valid_integer? @isbn
    result
  end

  def valid_string?(str)
    return false unless (str.is_a? String) && !str.empty?
    true
  end

  def valid_date?(date)
    return false unless date.is_a? Date
    true
  end

  def valid_integer?(value)
    return false unless (value.is_a? Integer) && value.between?(10**9, 10**10)
    true
  end
end