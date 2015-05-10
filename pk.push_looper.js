/*
 TODO
 - listen for session button, then session-x-offset
 - set up looper tracks in grid

 FORUMS
 - call js function on [freebang]? Max freezes up...
*/


function log() {
  for(var i=0,len=arguments.length; i<len; i++) {
    var message = arguments[i];
    if(message && message.toString) {
      var s = message.toString();
      if(s.indexOf("[object ") >= 0) {
        s = JSON.stringify(message);
      }
      post(s);
    }
    else if(message === null) {
      post("<null>");
    }
    else {
      post(message);
    }
  }
  post("\n");
}



var PK_IMAGE = [
    [5, 5, 5, 0, 5, 0, 0, 5],
    [5, 0, 0, 5, 5, 0, 5, 0],
    [5, 0, 0, 5, 5, 5, 5, 0],
    [5, 5, 5, 0, 5, 5, 0, 0],
    [5, 0, 0, 0, 5, 5, 0, 0],
    [5, 0, 0, 0, 5, 0, 5, 0],
    [5, 0, 0, 0, 5, 0, 0, 5],
    [5, 0, 0, 0, 5, 0, 0, 5],
];


var BLANK_IMAGE = [
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
];

function Push(options) {

    options = typeof options !== 'undefined' ? options : {};

    this.init = function() {
        this.bLiveAPIInit = false;
        this.bPushFound = false;
        this.api = null;
        this.grid = null;
        this.gridGrabbed = false;
        this.gridData = [
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
        ];
        this.dead = false;
        
        // just check a little time after the live api might be initialized
        // in case we are in js dev mode and no [live.thisdevice] bang is coming.
        // if a [live.thisdevice] bang already came then running it again won't hurt.
        this.pollCheck = new Task(doPoll);
        this.pollCheck.schedule(500);
        
        // the regular polling task
        this.pollRepeat = new Task(doPoll);
        this.pollRepeat.interval = 1000;
    }

    // keep the live object updated
    this.poll = function() {
        if(this.bLiveAPIInit == false) {
            this.bLiveAPIInit = true;
            if(options.onLiveAPIInit) {
                options.onLiveAPIInit();
            }
        }
        var exists = false;
	      for(var i=0; i < 6; i++) {
		        var api = new LiveAPI("control_surfaces " + i);
            if(api.type == DEV_NAME) {
                var thisId = this.api != null ? this.api.id : null;
                if(this.api && this.api.id == api.id) {
                    exists = true;
                } else if(!this.api || this.api.id != api.id) {
                    this.api = api;
                    var gridId = this.api.call('get_control_by_name', 'Button_Matrix');
                    this.grid = new LiveAPI(function(x, y, z) {
                        if(x[0] == 'value' && x[1] != 'bang' && options.onButtonEvent) {
                            options.onButtonEvent.call(this, x[1], x[2], x[3]);
                        }
                    });
                    this.grid.id = gridId[1];
                    this.grid.property = 'value';
                    exists = true;
                    if(this.bPushFound == false) {
                        this.bPushFound = true;
                        if(options.onPushFound) {
                            options.onPushFound();
                        }
                    }
                    if(options.onPushConnected) {
                        options.onPushConnected();
                    }
                }
            }
	      }
        if(!exists && this.api) {
            this.api = null;
            this.grid = null;
            if(options.onPushDisconnected) {
                options.onPushDisconnected();
            }
        }
    }

    this.destroy = function() {
        this.releaseGrid();
        this.dead = true;
    };

    this.setButton = function(x, y, z) {
        if(x < 0 || x > 7 || y < 0 || y > 7 || z < 0 || z > 255) {
            log('Push.setButton() invalid arguments: ' + x + ', ' + y + ', ' + z);
        }
        if(this.gridGrabbed && this.grid) {
            this.grid.call('send_value', x, y, z);
        }
        this.gridData[y][x] = z;
    }

    this.setAllButtons = function(x) {
        for(var i=0; i < 8; i++) {
            for(var j=0; j < 8; j++) {
                this.setButton(i, j, x);
            }
        }
    }

    this.clearAllButtons = function() {
        for(var i=0; i < 8; i++) {
            for(var j=0; j < 8; j++) {
                this.setButton(i, j, 0);
            }
        }
    }

    this.grabGrid = function() {
        if(this.api) {
            this.api.call('grab_control', 'id', this.grid.id);
            this.gridGrabbed = true;
        }
    }

    this.releaseGrid = function() {
        if(this.api) {
            this.api.call('release_control', 'id', this.grid.id);
            this.gridGrabbed = false;
        }
    }

    this.recallData = function() {
        for(var i=0; i < this.gridData.length; i++) {
            var row = this.gridData[i];
            for(var j=0; j < row.length; j++) {
                var x = row[j];
                this.setButton(j, i, x);
            }
        }
    }

    this.setImage = function(data) {
        for(var i=0; i < data.length; i++) {
            var row = data[i];
            for(var j=0; j < row.length; j++) {
                var x = row[j];
                this.setButton(j, i, x);
            }
        }
    }

    this.setPK = function() {
        this.setImage(PK_IMAGE);
    }

    this.init();
}



function FindDevices(options) {

    function doTrack(api, path) {
        api.path = path;
        var nDevices = api.getcount('devices');
        for(var i=0; i < nDevices; i++) {
            doDevice(api, path + ' devices ' + i);
        }
    }

    function doDevice(api, path) {
        api.path = path;
        if(api.get('class_name') == options.type) {
            if(ret[iCurrentTrack] == undefined) { // keep it simple and only add the first match
                ret[iCurrentTrack] = api.id;
            }
        }
        if(api.children.indexOf('chains') > -1) {
            var nChains = api.getcount('chains');
            for(var i=0; i < nChains; i++) {
                doChain(api, path + ' chains ' + i)
            }
        }
    }

    function doChain(api, path) {
        api.path = path
        var nDevices = api.getcount('devices');
        for(var i=0; i < nDevices; i++) {
            doDevice(api, path + ' devices ' + i);
        }
    }

    var ret = {};
    var api = new LiveAPI('live_set');
    var iCurrentTrack;
    var nTracks = api.getcount('tracks');
    for(var i=0; i < nTracks; i++) {
        iCurrentTrack = i;
        doTrack(api, 'live_set tracks ' + i);
    }
    return ret;
}



// public api

function poll() {
    push.pollCheck.schedule(1);
}


function release() {
    push.releaseGrid();
}

function grab() {
    push.grabGrid();
    push.recallData();
}

function clear() {
    push.clearAllButtons();
}

function set_pk() {
    push.setPK();
}

function midi(note, vel) {
    log('midi: ', note, vel);
}

var bPolling = false;
function doPoll() {
    push.poll();
    if(bPolling == false) {
        push.pollRepeat.repeat();
        bPolling = true;
    }
}
doPoll.local = true;


log("___________________________________________________");
//log("Reload:", new Date);

autowatch = 1;
inlets = 1;
outlets = 1;


function onLevelMeter(x, y, z) {
    if(x[0] == 'output_meter_left' && x[1] != 'bang') {
        var level = x[1];
        var color = 0;
        var nCells = 0;
        if(level == 0) {
            color = 0;
            nCells = 0;
        }
        else if(level <= 0.3) {
            color = 86;
            nCells = 1;
        } else if (level <= 0.5) {
            color = 13;
            nCells = 2;
        } else if (level <= 0.9) {
            color = 84;
            nCells = 3;
        } else {
            color = 5; // peak
            nCells = 4;
        }
        for(var row=7; row >= 4; row--) {
            var isLit = row > (7 - nCells);
            push.setButton(this.track_index, row, isLit ? color : 0);
        }
    }
}

function onLooperChange(x) {
    if(x[0] == 'value' && this.track_index !== undefined) {
        var value = x[1];
        if(this.get('name') == 'State') {
            if(value == 0) { // stop
                push.setButton(this.track_index, 0, this.bBufferFilled ? 123 : 0)
                push.setButton(this.track_index, 1, this.bBufferFilled ? 7 : 0)
                push.setButton(this.track_index, 2, this.bBufferFilled ? 7 : 0)
            } else if(value == 1) { // rec
                push.setButton(this.track_index, 0, 5)
                push.setButton(this.track_index, 1, 5)
                push.setButton(this.track_index, 2, 7)
            } else if(value == 2) { // play
                push.setButton(this.track_index, 0, 21)
                push.setButton(this.track_index, 1, 5)
                push.setButton(this.track_index, 2, 7)
            } else if(value == 3) { // dub
            }
        } else if(this.get('name') == 'Reverse') {
            push.setButton(this.track_index, 3, value ? 45 : 43); // 43 is light blue;
        }
    }
}


function blankPush() {
//    push.releaseGrid();
    push.setImage(BLANK_IMAGE);
}



var DEV_NAME = 'Push';
var push = new Push({
    onLiveAPIInit: function() {
        var foundLoopers = FindDevices({
            type: 'Looper'
        });
        var loopers = {};
        var levels = {};
        for(var track in foundLoopers) {
            // observe loopers
            var looper = {};
            looper.looper = new LiveAPI('id ' + foundLoopers[track]);
            looper.bBufferFilled = false;
            var param = new LiveAPI(onLooperChange);
            var params = looper.looper.get('parameters');
            for(var i=0; i < params.length ; i++) {
                if(params[i] != 'id') {
                    param.id = params[i];
                    if(param.get('name') == 'State') {
                        looper.state = param;
                        looper.state.property = 'value';
                        looper.state.track_index = track;
                        param = new LiveAPI(onLooperChange);
                    } else if(param.get('name') == 'Reverse') {
                        looper.reverse = param;
                        looper.reverse.property = 'value';
                        looper.reverse.track_index = track;
                        param = new LiveAPI(onLooperChange);
                    }
                }
            }
            loopers[track] = looper;
            // observe level meters
            var observer = new LiveAPI(onLevelMeter, 'live_set tracks ' + track);
            observer.property = 'output_meter_left';
            observer.track_index = track;
            levels[track] = observer;
        }
    },
    onPushFound: function() {
		    log('*** Push found');
        push.grabGrid();
        push.setImage(PK_IMAGE);
        var blankTask = new Task(blankPush);
        blankTask.schedule(1000);
    },
    onPushConnected: function() {
		    log('*** Push connected');
    },
    onPushDisconnected: function() {
        log('*** Push disconnected');
    },
    onButtonEvent: function(velocity, x, y) {
        log('onButtonEvent: ', velocity, x, y);
    }
});


