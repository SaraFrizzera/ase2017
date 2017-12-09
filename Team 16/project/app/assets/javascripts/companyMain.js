var app = new Vue({
    el: '#app',
    data: {
        activities: [],
        users: [],
        sum: 0,
        loaded: 'nopz',
        notLoaded: 'ok'
    },
    computed: {
        company: function() {
            return JSON.parse(window.localStorage.getItem('company'));
        }
    },
    watch: {

    },
    methods: {
        getActivities: function() {
            axios({
                method: 'get',
                url: '/activities',
                headers: {
                    'Content-Type': 'application/json',
                }
            })
                .then(function (response) {
                    response.data.forEach(function(element, index, array) {
                        if(app.company.id === element.company_id) {
                            app.activities.push(element);
                        }
                    });
                })
                .catch(function (error) {
                    alert(error);
                });
        },
        getUsers: function() {
            axios({
                method: 'get',
                url: '/users',
                headers: {
                    'Content-Type': 'application/json',
                }
            })
                .then(function (response) {
                    app.activities.forEach( function(element) {
                        response.data.forEach( function(user) {
                            if(user.id == element.user_id) { 
                                var c = 0;
                                if(app.users.length == 0) app.users.push(user);
                                app.users.forEach(function(inner_user, index, array) {
                                    if(inner_user.id == user.id) c++;
                                    if(index == array.length - 1 && c == 0) app.users.push(user);
                                });
                            }
                        });
                    });
                })
                .catch(function (error) {
                    alert(error);
                });
        },
        setSum: function(h) {
            this.sum = this.sum + h;
        },
        getSum: function() {
            var s = this.sum;
            this.sum = 0;
            $('#isLoading').css('display', 'none');
            $('#isReady').css('display', 'block');
            return s;
        }
    }
});

$(document).ready(function() {
    app.getActivities();
    app.getUsers();
    console.log(app.activities);
    console.log(app.users);
    // console.log(app.sum[0]);
});































