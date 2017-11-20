var app = new Vue ({
    el: '#app',
    data: {
        message: 'Hello Vue!'
    },
    computed: {
        reverseMessage: function() {
            return this.message.split('').reverse().join('');
        }
    }
});

console.log('sdfdsf');