var app = new Vue({
    el: '#app',
    data: {
        events: [],
        lastEvent: '',
        lastContainerClickedStart: 0,
        lastContainerClickedEnd: 9,
        lastEventDesc: ''
    },
    watch: {
        events: function () {
            console.log(this.events[this.events.length - 1]); 
        },
        lastContainerClickedEnd: function() {
            if(this.lastContainerClickedEnd != '' || this.lastContainerClickedEnd < this.lastContainerClickedStart) this.setLastEvent();
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
            this.lastContainerClickedLength = this.lastContainerClickedEnd - this.lastContainerClickedStart;
            this.addEvent();
            //this.events.push(lastContainerClicked);
            //console.log(events);
        },
        addEvent: function() {
            // $('#start-time-add-event').timepicker('setTime', this.lastContainerClicked.start + ':00');
            // $('#end-time-add-event').timepicker('setTime', this.lastContainerClicked.end + ':00');
            $('.just-created-event').height(this.cellHeight * this.lastContainerClickedLength);
            if(!$('#overlay').hasClass('show-overlay')) this.addDetailsToEvent();
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
    app.setCellHeight();
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
    $(".event-wrapper").mouseup(function(obj_end) {
        addNewEvent(obj, obj_end);
    });
});

function addNewEvent(obj, obj_end) {
    app.lastContainerClickedStart = obj.target.id.split('-')[0];
    app.lastContainerClickedEnd = obj_end.target.id.split('-')[0];
    
    $('.event-animation-creation').addClass('event just-created-event');
    $('.event-animation-creation').removeClass('event-animation-creation');
    app.currentContainer = null;
}

