var app = new Vue({
    el: '#app',
    data: {
        events: [],
        lastEvent: '',
        lastContainerClicked: {
            start: '',
            end: ''
        }
    },
    watch: {
        events: function () {
            console.log(this.events[this.events.length - 1]); 
        },
        lastContainerClicked: function() {
            this.setLastEvent();
        }
    },
    methods: {
        setLastEvent: function () {
            //this.lastEvent = this.events[this.events.length - 1];
            this.calculateNoOfCells();
        },
        setCellHeight: function () {
            this.cellHeight = $('.first-column-wrapper').height() + 3;
        },
        calculateNoOfCells: function() {
            this.lastContainerClicked.length = this.lastContainerClicked.end.split('-')[0] - this.lastContainerClicked.start.split('-')[0];
            this.addEvent();
            //this.events.push(lastContainerClicked);
            //console.log(events);
        },
        addEvent: function() {
            $('.just-created-event').height(this.cellHeight * this.lastContainerClicked.length);
            this.addDetailsToEvent();
        },
        addDetailsToEvent: function() {
            $('#overlay').addClass('pre-show-overlay');
            $('#overlay').addClass('show-overlay');
            //$('.just-created-event').removeClass('just-created-event');
        }
    },
    computed: {
    }
});

var hammertime = new Hammer(document.getElementById('table-body'), { threshold: 0 });

hammertime.get('pan').set({ direction: Hammer.DIRECTION_VERTICAL });

hammertime.on('panstart', function (ev_start) {
    $('#' + app.currentContainer).append('<div class="event event-animation-creation"></div>');
    hammertime.on('pan', function (ev_pan) {
        $('.event-animation-creation').height(Math.sqrt(Math.pow((ev_pan.center.y - ev_start.center.y), 2)));
        // app.events.push({
        //     x: ev_start.center.x,
        //     y: ev_start.center.y,
        //     length: ev_end.center.y - ev_start.center.y
        // });
    });
});

$(window).resize(function () {
    app.setCellHeight();
    // app.tablePosition = {
    //     x: document.getElementById('table-body').getBoundingClientRect().x
    // }
});

$(document).ready(function() {
    var settings = {
        showSeconds: false,
        maxHours: 24,
        defaultTime: false,
        showMeridian: false,
        minuteStep: 60,
        icons: {
            up: 'octicon-triangle-up',
            down: 'octicon-triangle-down'
        }
    };
    app.setCellHeight();
    $('#start-time-add-event').timepicker(settings);
    $('#end-time-add-event').timepicker(settings);
});

$(".event-wrapper").mousedown(function (obj) {
    app.currentContainer = obj.target.id;
    $(".event-wrapper").mouseup(function(obj_end) {
        app.lastContainerClicked = {
            end: obj_end.target.id,
            start: obj.target.id
        };
        $('.event-animation-creation').addClass('event just-created-event');
        $('.event-animation-creation').removeClass('event-animation-creation');
        app.currentContainer = null;
    });
});