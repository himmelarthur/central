module.exports = {

    stripLeadingSlash: function (str) {
        if (str[0] === '/') {
            return str.substr(1, str.length);
        }
        return str;
    }

};
