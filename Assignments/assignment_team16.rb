######
# Implementa le seguenti funzioni come richiesto nel commento che le precede
######

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
def count_uppercase_letters(string)
  return string.scan(/[A-Z]/).length
end



######
# Completa l'implementazione delle seguenti classi seguendo quanto
# richiesto dai commenti.
######
class Point2D
  # la classe punto deve avere rendere accessibili gli attributi `x` e `y`
  # IN SOLA LETTURA
  attr_reader :x, :y

  # costruisce un punto con coordinate (x,y)
  # nota che non e' necessario nessun controllo sul tipo di x e y
  def initialize(x, y)
    @x = x
    @y = y
  end

  # la funzione `+` riceve come argomento un oggetto Point2D e restituisce un
  # nuovo oggetto Point2D che ha come coordinate la somma delle coordinate dei
  # due oggetti. (x1 + x2, y1 + y2)
  # la funzione non deve alterare lo stato interno dell'oggetto, ma restituire
  # un nuovo oggetto
  def +(other)
    Point2D.new(@x + other.x, @y + other.y)
  end

  # Restituisce una rappresentazione testuale dell'oggetto punto, nella forma
  # "(x,y)", senza spazi.
  # ES: siano x = 1, y = 2.345, la funzione deve restituire "(1,2.345)"
  def to_s
    "(#{@x},#{@y})"
  end
end

require 'date' # necessario per l'uso della classe Date

class Book
  attr_accessor :title, :author, :release_date, :publisher, :isbn

  # Implementa il costruttore
  # dai un'occhiata a https://robots.thoughtbot.com/ruby-2-keyword-arguments
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
    return false unless   (valid_string? @title) &&
                          (valid_string? @author) &&
                          (valid_date? @release_date) &&
                          (valid_string? @publisher) &&
                          (valid_integer? @isbn)
    true
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