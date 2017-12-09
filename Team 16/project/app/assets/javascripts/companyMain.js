var app = new Vue({
    el: '#app',
    data: {
        activities: [],
        users: [],
        sum: []
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
        getHours: function() {
            this.users.forEach(function(o_element, o_index, o_array) {
                var sum = 0;
                this.activities.forEach( function(element, index, array) {
                    if(o_element.id == element.user_id) {
                        var start_time = parseInt(element.start_time.split('T')[1].split(':')[0]);
                        var end_time = parseInt(element.end_time.split('T')[1].split(':')[0]);
                        console.log(sum + '' + start_time + '' + end_time);
                        sum = sum + (end_time - start_time);
                    }
                    if(index == array.length - 1) app.sum[o_index] = sum;
                });
            });
        }
    }
});

$(document).ready(function() {
    app.getActivities();
    app.getUsers();
    app.getHours();
    console.log(app.activities);
    console.log(app.users);
    console.log(app.sum[0]);
});































