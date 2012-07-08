function urlencode --description 'URL encode string'
	python -c "import sys, urllib as ul; print [ul.quote_plus(x) for x in sys.argv[1:]]" $argv
end

function urldecode --description 'URL decode string'
    python -c "import sys, urllib as ul; print [ul.unquote_plus(x) for x in sys.argv[1:]]" $argv
end

function json --description 'Pretty Print JSON string'
    python -mjson.tool
end