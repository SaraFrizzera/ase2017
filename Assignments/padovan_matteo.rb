######
# Implementa le seguenti funzioni come richiesto nel commento che le precede
######

# Restituisce una stringa che dice "Benvenuto"
def welcome_message
  "Benvenuto"
end

# Restituisce n! (fattoriale)
def factorial(n)
  (1..n).inject(:*) || 1
end

# Restituisce la stringa più lunga in un array di stringhe
def find_longest_string(array)
  return false if array.length == 0
  array.sort!
  return array[array.length - 1]
end

# Restituisce true se l'array contiene altri array (es. [[1],2,3] => true)
def has_nested_array?(array)
  array.each do |element|
      return true if element.kind_of?(Array)
  end
  return false
end

# Conta il numero di caratteri maiuscoli in una stringa
def count_upcased_letters(string)
    return false if !string.kind_of?(String)
    c = 0
    string.split('').each do |element|
      if element != element.downcase
        c = c + 1
      end
    end
    return c
  end

# Converte un numero in numero romano
def to_roman(n)
  resto = []
  num = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  num.each do |element| 
      resto.push(n / element)
      n = n % element 
  end
  chars = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  resto.each_with_index.map do |element, index|
      chars[index] * element
  end.join
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
  def + (point)
      return Point2D.new(@x + point.x, @y + point.y)
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
  def initialize(title: "default_title", author: "default_author", release_date: "default_date", publisher: "default_publisher", isbn: "default_isbn")
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
    nil
  end

  # restituisce un array di simboli.
  # Se l'oggetto e' valido, restituisce un vettore vuoto
  # Se non lo e', per ogni attributo che non e' valido, la chiave per
  # quell'attributo deve essere presente nel vettore, in qualsiasi ordine.
  # esempio: title e author non sono validi, restituisce [:title, :author]
  def errors
    nil
  end
end