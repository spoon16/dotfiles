function copy --description 'Trim new lines and copy to clipboard'
    # this will not exit if nothing is piped in
    tr -d '\n' | pbcopy
end
