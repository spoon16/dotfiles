function airport --description "Get airport code information"
    for code in $argv
        curl -s "http://airportcode.riobard.com/airport/$code?fmt=JSON" | json
    end
end
