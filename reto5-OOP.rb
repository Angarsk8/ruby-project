require 'csv'

class Reto5
    
    attr_reader :definitions, :attempts
    def initialize(text_file_name)
        @definitions = load_definitions(text_file_name)
        @questions = @definitions.length
        @attempts = 0
    end
    
    def start
        begin
            greet
            play(@definitions)
            congratulate
        rescue Exception => e
            puts e.message
        end
    end
    
    def load_definitions(text_file_name)
        CSV.read(text_file_name).shuffle
    end
    
    def greet
        print "Bienvenido a reto 5. Para jugar solo ingresa el término ",
              "correcto para cada una de las definiciones. Listo? Vamos!!"
    end
    
    def play(list_of_definitions)
        list_of_definitions.each do |definition|
            puts "Definición", "#{definition[0]}:"
            loop do
                print "Adivinar: "
                answer = nil
                loop {break unless (answer = gets.chomp.strip.downcase).empty?}
                valid = answer == definition[1].downcase
                puts valid ? "Correcto" : "Incorrecto, Trata de nuevo"
                @attempts += 1
                break if valid
            end
        end
    end
    
    def congratulate
        puts "Felicitaciones!! Has completado todas las definiciones correctamente!",
             "Resultado: #{@attempts} intentos de #{@questions} preguntas"
    end

    private :load_definitions, :greet, :play, :congratulate
end
    
session1 = Reto5.new('definitions.txt')
session1.start
