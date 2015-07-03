require 'csv'

class Reto5
    
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
        rescue
            puts e.message
        end
    end
    
    def load_definitions(text_file_name)
        CSV.read(text_file_name).shuffle
    end
    
    def greet
    end
    
    def play(list_of_definitions)
    end
    
    def congratulate
    end
    
    def get_definitions
    end
    
    def get_last_attempts
    end
    
    private :load_definitions, :greet, :play, :congratulate
end