require 'csv'

definitions = CSV.read('definitions.txt').shuffle

puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"

definitions.each do |value|
    puts "Definición", "#{value[0]}:"
    loop do
        print "Adivinar: "
        answer = gets.chomp.strip.downcase
        valid = answer == value[1].downcase
        puts valid ? "Correcto" : "Incorrecto!, Trata de nuevo"
        break if valid
    end
end

puts "Felicitaciones!! Has completado todas las definiciones correctamente!"
    