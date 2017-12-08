var app = new Vue({
    el: '#app',
    data: {
        events: [],
        lastEvent: '',
        lastContainerClickedStart: null,
        lastContainerClickedEnd: null,
        lastEventDesc: '',
        companies: [
            { companyName: null }
        ],
        loaded: 0
    },
    watch: {
        events: function () {
            console.log(this.events[this.events.length - 1]);
        },
        lastContainerClickedEnd: function () {
            if (this.lastContainerClickedEnd != '' || this.lastContainerClickedEnd >= this.lastContainerClickedStart || this.lastContainerClickedEnd < 24) this.setLastEvent();
        },
        loaded: function() {
            if(this.loaded == 1) this.loaded = 'ok';
        }
    },
    methods: {
        setLastEvent: function () {
            //this.lastEvent = this.events[this.events.length - 1];
            if (this.lastContainerClickedEnd != null) this.calculateNoOfCells();
        },
        setCellHeight: function () {
            this.cellHeight = $('.first-column-wrapper').height() + 3;
        },
        calculateNoOfCells: function () {
            this.lastContainerClickedLength = this.lastContainerClickedEnd - this.lastContainerClickedStart;
            this.addEvent();
            //this.events.push(lastContainerClicked);
            //console.log(events);
        },
        addEvent: function () {
            // $('#start-time-add-event').timepicker('setTime', this.lastContainerClicked.start + ':00');
            // $('#end-time-add-event').timepicker('setTime', this.lastContainerClicked.end + ':00');
            $('.just-created-event').removeClass('event-animation-creation');
            $('.just-created-event').height(this.cellHeight * this.lastContainerClickedLength);
            if (!$('#overlay').hasClass('show-overlay')) this.addDetailsToEvent();
        },
        addDetailsToEvent: function () {
            $('#overlay').addClass('pre-show-overlay');
            $('#overlay').addClass('show-overlay');
            //$('.just-created-event').removeClass('just-created-event');
        },
        getCompanies: function () {
            axios.get('/companies', {
                params: {
                    ContentType: 'application/json'
                }
            })
                .then(function (response) {
                    app.companies = response.data;
                    app.addEventsToCalendar();
                    //this.companies = response.data;
                    //console.log(this.companies);
                })
                .catch(function (error) {
                    alert(error);
                });
        },
        validateDayMonthTime: function () {
            app.lastContainerClickedDay.formattedDay = (app.lastContainerClickedDay.day < 10) ? '0' + app.lastContainerClickedDay.day : app.lastContainerClickedDay.day;
            app.lastContainerClickedDay.formattedMonth = (app.lastContainerClickedDay.month < 10) ? '0' + app.lastContainerClickedDay.month : app.lastContainerClickedDay.month;
            app.lastContainerClickedFormattedEnd = (app.lastContainerClickedEnd < 10) ? '0' + app.lastContainerClickedEnd : app.lastContainerClickedEnd;
            app.lastContainerClickedFormattedStart = (app.lastContainerClickedStart < 10) ? '0' + app.lastContainerClickedStart : app.lastContainerClickedStart;
            
        },
        getISOStringStartTime: function () {
            return '' + app.lastContainerClickedDay.year + '-' + app.lastContainerClickedDay.formattedMonth + '-' + app.lastContainerClickedDay.formattedDay + 'T' + app.lastContainerClickedFormattedStart + ':00:00.000Z';
        },
        getISOStringEndTime: function () {
            return '' + app.lastContainerClickedDay.year + '-' + app.lastContainerClickedDay.formattedMonth + '-' + app.lastContainerClickedDay.formattedDay + 'T' + app.lastContainerClickedFormattedEnd + ':00:00.000Z';
        },
        createActivity: function () {
            app.validateDayMonthTime();
            console.log(app.username);
            console.log(app.companyVat);
            console.log(app.getISOStringStartTime());
            console.log(app.getISOStringEndTime());
            //console.log(new Date(parseInt(app.lastContainerClickedDay.year), parseInt(app.lastContainerClickedDay.month), parseInt(app.lastContainerClickedDay.day), parseInt(app.lastContainerClickedStart), 0,0,0).toISOString());
            //console.log(app.lastContainerClickedStart);
            if(app.lastContainerClickedFormattedEnd == 24){
                alert('Can\'t display this task');
                $('.just-created-event').remove();
                this.resetViewAfterEventCreatedFull(false);
            } else {
                axios({
                    method: 'post',
                    url: '/activity',
                    headers: {
                        'Content-Type': 'application/json',
                        username: app.user.username,
                        vatNumber: app.companyVat,
                        startTime: app.getISOStringStartTime(),
                        endTime: app.getISOStringEndTime()
                    },
                    params: {
                        username: app.username,
                        vatNumber: app.companyVat,
                        startTime: app.getISOStringStartTime(),
                        endTime: app.getISOStringEndTime()
                    }
                  })
                    .then(function (response) {
                        $('.just-created-event > p').text('Worked for ' + app.companies.find(function(element) {
                            return element.vat_number == app.companyVat;
                        }).company_name);
                        //console.log($('.just-created-event > p').data());
                        app.resetViewAfterEventCreatedFull(true);
                        //this.companies = response.data;
                        //console.log(this.companies);
                    })
                    .catch(function (error) {
                        alert(error);
                    });
            }
        },
        resetViewAfterEventCreated: function() {
            $('#overlay').removeClass('pre-show-overlay show-overlay');
            $('.just-created-event').addClass('event-already-created');
            $('.just-created-event').removeClass('just-created-event');
            this.lastEventDesc = '';
            this.lastContainerClickedStart =  null;
            this.lastContainerClickedEnd =  null;
        },
        resetViewAfterEventCreatedFull: function(isFull) {
            if(!isFull) this.resetViewAfterEventCreated();
            else {
                var k = app.lastContainerClickedStart;
                var c = app.lastContainerClickedEnd;
                for(var i = k; i < c; i++) {
                    $('#' + i + '-' + this.lastContainerClickedDay.day + '_' + this.lastContainerClickedDay.month + '_' + this.lastContainerClickedDay.year).addClass('unusable');
                    console.log($('#' + i + '-' + this.lastContainerClickedDay.day + '_' + this.lastContainerClickedDay.month + '_' + this.lastContainerClickedDay.year).hasClass('unusable'));
                }
                this.resetViewAfterEventCreated();
            }
        },
        addEventsToCalendar: function() {
            axios({
                method: 'get',
                url: '/activities',
                headers: {
                    'Content-Type': 'application/json',
                }
              })
                .then(function (response) {
                    response.data.forEach(function(element) {
                        if(element.user_id == app.user.id) {
                            var start_time = parseInt(element.start_time.split('T')[1].split(':')[0]);
                            var end_time = parseInt(element.end_time.split('T')[1].split(':')[0]);
                            var day = parseInt(element.start_time.split('T')[0].split('-')[2]);
                            var month = parseInt(element.start_time.split('T')[0].split('-')[1]);
                            var year = element.start_time.split('T')[0].split('-')[0];
                            console.log(start_time + '-' + day + '-' + month + '-' + year);
                            $('#' + start_time + '-' + day + '_' + month + '_' + year).append('<div class="event just-created-event"><p></p></div>');
                            $('.just-created-event').height(app.cellHeight * (end_time - start_time));
                            $('.just-created-event > p').text('Worked for ' + app.companies.find(function(wrapped_element) {
                                return wrapped_element.id == element.company_id;
                            }).company_name);
                            $('.just-created-event').removeClass('just-created-event');
                            var k = start_time;
                            var c = end_time;
                            for(var i = k; i < c; i++) {
                                $('#' + i + '-' + day + '_' + month + '_' + year).addClass('unusable');
                                console.log($('#' + i + '-' + day + '_' + month + '_' + year).hasClass('unusable'));
                            }
                        }
                    });
                    app.loaded = 1;
                })
                .catch(function (error) {
                    alert(error);
                });
        }
    },
    computed: {
        user: function() {
            return JSON.parse(window.localStorage.getItem('user'));
        }
    }
});

var hammertime = new Hammer(document.getElementById('table-body'), { threshold: 0 });

hammertime.get('pan').set({ direction: Hammer.DIRECTION_VERTICAL });

hammertime.on('panstart', function (ev_start) {
    if(!$('#' + ev_start.target.id).hasClass('unusable')) {
        $('#' + app.currentContainer).append('<div class="event event-animation-creation"><p></p></div>');
        hammertime.on('pan', function (ev_pan) {
            $('.event-animation-creation').height(Math.sqrt(Math.pow((ev_pan.center.y - ev_start.center.y), 2)));
            // app.events.push({
            //     x: ev_start.center.x,
            //     y: ev_start.center.y,
            //     length: ev_end.center.y - ev_start.center.y
            // });
        });
    }
});

$(window).resize(function () {
    app.setCellHeight();
    app.getCompanies();
    app.setLastEvent();
    // app.resizeEvents();
    // app.tablePosition = {
    //     x: document.getElementById('table-body').getBoundingClientRect().x
    // }
});

$(document).ready(function () {
    app.setCellHeight();
    app.getCompanies();
    //app.addEventsToCalendar();
    $(document).keyup(function(e) {
        if (e.keyCode == 27 && $('#overlay').hasClass('show-overlay')) { // escape key maps to keycode `27`
            $('.just-created-event').remove();
            app.resetViewAfterEventCreated(false);
           // <DO YOUR WORK HERE>
       }
   });
    // $('#start-time-add-event').timepicker(settings).on('changeTime.timepicker', function(e) {
    //     app.lastContainerClicked = {
    //         start: e.time.hours
    //     };
    //     console.log(app.lastContainerClicked.start);
    // });
    // $('#end-time-add-event').timepicker(settings).on('changeTime.timepicker', function(e) {
    //     app.lastContainerClicked.end = e.time.hours;
    // });
});

$(".event-wrapper").mousedown(function (obj) {
    app.currentContainer = obj.target.id;
    $(".event-wrapper").mouseup(function (obj_end) {
        if(obj.target.id != obj_end.target.id && !$('#' + obj.target.id).hasClass('unusable') && !$('#' + obj_end.target.id).hasClass('unusable')) addNewEvent(obj, obj_end);
    });
});

function addNewEvent(obj, obj_end) {
    app.lastContainerClickedDay = {
        day: obj.target.id.split('-')[1].split('_')[0],
        month: obj.target.id.split('-')[1].split('_')[1],
        year: obj.target.id.split('-')[1].split('_')[2]
    };
    app.lastContainerClickedStart = obj.target.id.split('-')[0];
    app.lastContainerClickedEnd = obj_end.target.id.split('-')[0];

    $('.event-animation-creation').addClass('event just-created-event');
    $('.event-animation-creation').removeClass('event-animation-creation');
    app.currentContainer = null;
}

