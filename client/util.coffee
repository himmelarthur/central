module.exports =

    stripLeadingSlash: (str) ->
        if str[0] is '/' then str.substr(1, str.length) else str
