# Restituisce una stringa che dice "Benvenuto"
 def return_message
   "Benvenuto"
 end

# Restituisce n! (fattoriale)
def factorial_number
   (2..self).inject(1) { |f, n| f * n }
end

# Restituisce la stringa più lunga in un array di stringhe
def widest_string(array)
  return array.map(&:length).max
end

# Restituisce true se l'array contiene altri array (es. [[1],2,3] => true)
def boolean_nested_array(array)
  array.each do |slot|
    return true if slot.kind_of?(Array)
  end
  return false
end

# Conta il numero di caratteri maiuscoli in una stringa

def count_uppercase_letters(string)
  return string.scan(/[A-Z]/).length
end

# Converte un numero in numero romano
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

def to_roman(n)
  ROMAN_NUMBERS.map do |ltr, val|
    amt, n = n.divmod(val)
    ltr * amt
  end.join
end

######
# Completa l'implementazione delle seguenti classi seguendo quanto
# richiesto dai commenti.
######

class Point2D

  # la classe punto deve avere rendere accessibili gli attributi x e y
  # IN SOLA LETTURA
  attr_reader :x, :y
  # costruisce un punto con coordinate (x,y)
  # nota che non e' necessario nessun controllo sul tipo di x e y
  def initialize(x, y)
    @x = x
    @y = y
  end

  # la funzione + riceve come argomento un oggetto Point2D e restituisce un
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