var input = require('readline-sync');

var integer = input.question('Input integer: ')

console.log(convertInteger(integer));

function convertInteger(value) {
    var hour, minute, second

    if (value) {
        hour = Math.floor(value / 3600)
        if (hour) {
            minute = Math.floor((value % 3600) / 60)
            if (minute) {
                second = Math.floor((value % 3600) % 60)
            }
        }
    }

    return (hour + " jam, " + minute + " menit, " + second + " detik")
}