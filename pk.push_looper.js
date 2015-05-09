/*
 TODO
 - grab button input
 - detect loopers
 - listen for session button, then session-x-offset
 - set up looper tracks in grid

 FORUMS
 - callback for live api initialized? f.ex internal version of [live.thisdevice]. kind of annoying...
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

 

function Push(options) {

    options = typeof options !== 'undefined' ? options : {};

    this.init = function() {
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
    }

    // keep the live object updated
    this.poll = function() {
        var exists = false;
	      for(var i=0; i < 6; i++) {
		        var api = new LiveAPI("control_surfaces " + i);
            if(api.type == DEV_NAME) {
                var thisId = this.api != null ? this.api.id : null;
                if(this.api && this.api.id == api.id) {
                    exists = true;
                } else if(!this.api || this.api.id != api.id) {
                    this.api = api;
		                log('*** Push connected, id: ' + api.id + ', path: ' + api.path);
                    var gridId = this.api.call('get_control_by_name', 'Button_Matrix');
                    this.grid = new LiveAPI(function(x, y, z) {
                        if(x[0] == 'value' && x[1] != 'bang' && options.onButtonEvent) {
                            options.onButtonEvent.call(this, x[1], x[2], x[3]);
                        }
                    });
                    this.grid.id = gridId[1];
                    this.grid.property = 'value';
                    exists = true;
                }
            }
	      }
        if(!exists && this.api) {
            log('*** Push disconnected');
            this.api = null;
            this.grid = null;
        }
    }


    this.destroy = function() {
        log('Push.destroy()');
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
            for(var j=0; i < 8; i++) {
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
                this.setButton(i, j, x);
            }
        }
    }

    this.init();
}


// public api

function poll() {
    pollCheck.schedule(1);
}

function free() {
//    push.destroy();
//    push = null;
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

function doPoll() {
    push.poll();
    if(bPolling == false) {
        pollRepeat.repeat();
        bPolling = true;
    }
}


log("___________________________________________________");
//log("Reload:", new Date);

autowatch = 1;
inlets = 1;
outlets = 1;

var DEV_NAME = 'Push';
var push = new Push({
    onButtonEvent: function(velocity, x, y) {
        log('onButtonEvent: ', velocity, x, y);
    }
});


// just check a little time after the live api might be initialized
// in case we are in js dev mode and no [live.thisdevice] bang is coming.
// if a [live.thisdevice] bang already came then running it again won't hurt.
var pollCheck = new Task(doPoll, this);
pollCheck.schedule(250);

var bPolling = false;
var pollRepeat = new Task(doPoll, this);
pollRepeat.interval = 1000;

