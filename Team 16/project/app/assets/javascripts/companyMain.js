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
                app.getUsers();
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
    console.log(app.activities);
    console.log(app.users);
    initializeCompanyChart();
});



function initializeCompanyChart(){
    var dataSource = [];

    axios({
        method: 'get',
        url: '/company/work/amount',
        headers: {
            'Content-Type': 'application/json',
            'companyName': app.company.company_name
        }
    })
    .then(function (response) {
        dataSource = response.data
        console.log(response.data);
        initializeChart(dataSource, "user", "amount");
    })
    .catch(function (error) {
        alert(error);
    });


/*

    var dataSource = [{
        user: "User1",
        amount: 12
    }, {
        user: "User2",
        amount: 7
    }, {
        user: "User3",
        amount: 7
    }, {
        user: "User4",
        amount: 7
    }, {
        user: "User5",
        amount: 6
    }, {
        user: "User6",
        amount: 5
    }, {
        user: "User7",
        amount: 2
    }, {
        user: "Other",
        amount: 55
    }];
*/
    
}




