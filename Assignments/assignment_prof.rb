# Ritorna 'Benvenuto'
def welcome_message
  'Benvenuto'
end

# Restituisce n! e verifica che n sia un numero
# https://ruby-doc.org/core-2.4.1/Enumerable.html#method-i-reduce
def factorial(number)
  raise ArgumentError.new("L'argomento deve essere un numero") unless number.is_a?(Numeric)
  return 1 if number.zero?
  (1..number).reduce :*
end

# Trova la stringa più lunga in un array
# https://ruby-doc.org/core-2.4.1/Enumerable.html#method-i-max_by
def find_longest_string(array)
  array.max_by { |string| string.length }
end

# Verifica se l'array contiene altri array. Basta controllare il tipo di ogni elemento
# https://ruby-doc.org/core-2.4.1/Object.html#method-i-is_a-3F
def has_nested_array?(array)
  return false if array.empty?
  array.map { |item| item.is_a? Array }.reduce :|
end

# Conta le lettere maiuscole nella stringa
# Verifica quanti caratteri rientrano nella regex [A-Z]
def count_upcased_letters(string)
  string.chars.count { |character| /[A-Z]/.match character }
end

ROMAN_NUMERALS = %w(I V X L C D M).freeze

# Converte una cifra in numero romano in base al suo posto nel numero (0 = unità)
def digit_to_roman(digit, index)
  unit = index < 4 ? ROMAN_NUMERALS[index * 2] : ROMAN_NUMERALS[-1]
  five = index < 4 ? ROMAN_NUMERALS[index * 2 + 1] : ''
  next_unit = index < 4 ? ROMAN_NUMERALS[index * 2 + 2] : ''

  return unit * digit if index >= 4

  case digit
  when (1..3)
    unit * digit
  when 4
    "#{unit}#{five}"
  when 5
    five
  when (6..8)
    "#{five}#{unit * (digit - 5)}"
  when 9
    "#{unit}#{next_unit}"
  else
    ''
  end
end

# Converte n in numero romano (usando le stringe ma si può anche usare il modulo)
def to_roman(number)
  digits = number.to_s.chars # converte il numero in un array di cifre
  digits.reverse
        .map.with_index { |digit, index| digit.to_i.zero? ? '' : digit_to_roman(digit.to_i, index) }
        .reverse
        .compact
        .join
end

#####
# Esercizi con le classi
#####

class Point2D
  # costruisce un punto con coordinate (x,y)
  # nota che non e' necessario nessun controllo sul tipo di x e y
  def initialize(x, y)
    @x = x
    @y = y
  end

  # la classe punto deve avere rendere accessibili gli attributi `x` e `y`
  # IN SOLA LETTURA
  attr_reader :x, :y

  # la funzione `+` riceve come argomento un oggetto Point2D e restituisce un
  # nuovo oggetto Point2D che ha come coordinate la somma delle coordinate dei
  # due oggetti. (x1 + x2, y1 + y2)
  # la funzione non deve alterare lo stato interno dell'oggetto, ma restituire
  # un nuovo oggetto
  def + (point)
    self.class.new(x + point.x, y + point.y)
  end

  # Restituisce una rappresentazione testuale dell'oggetto punto, nella forma
  # "(x,y)", senza spazi.
  # ES: siano x = 1, y = 2.345, la funzione deve restituire "(1,2.345)"
  def to_s
    "(#{x},#{y})"
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
    
    @errors = []
  end

  # requisiti perche' un libro sia considerato valido:
  # title deve essere una stringa (@title.class == String) non vuota
  # author deve essere una stringa non vuota
  # release_date deve essere un oggetto Date
  # publisher deve essere una stringa non vuota
  # isbn deve essere un Fixnum minore di 10**10 e maggiore di 10**9
  def valid?
    @errors << :title if !@title.is_a?(String) || @title.empty?
    @errors << :author if !@author.is_a?(String) || @author.empty?
    @errors << :release_date unless @release_date.is_a?(Date)
    @errors << :publisher if !@publisher.is_a?(String) || @publisher.empty?
    @errors << :isbn unless @isbn.is_a?(Integer) && @isbn < 10**10 && @isbn >= 10**9
    
    @errors.empty?
  end

  # restituisce un array di simboli.
  # Se l'oggetto e' valido, restituisce un vettore vuoto
  # Se non lo e', per ogni attributo che non e' valido, la chiave per
  # quell'attributo deve essere presente nel vettore, in qualsiasi ordine.
  # esempio: title e author non sono validi, restituisce [:title, :author]
  def errors
    @errors
  end
end
