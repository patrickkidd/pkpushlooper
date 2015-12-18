/*
TODO
  - 
*/

autowatch = 1;
outlets = 1;
inlets = 1;

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



var _patcher = this.patcher;

PKPushState = new Global('PKPushState');
PKPushState.bPushFound = false;


// PUSH GRID EMULATOR


function UI() {

    this.buttons = [];
    var that = this;

    this.init = function() {
        this.count = 0;
	      this.buttons = [];
        for(var i=0; i < 64; i++) {
            var b = _patcher.getnamed('b_' + i);
			      // b.message('checkedcolor', 0, 0, 0, 0);
            // b.maxclass == 'toggle'
            // _patcher.firstobject, b.nextobject
            this.buttons.push(b);
        }
    };

    this.setButton = function(x, y, c) {
	      var i = x + y * 8;
	      var o = this.buttons[i];
	      if(!o) {
		        return;
	      };
//        log('UI.setButton', x, y, c);
        if(PUSH_VERSION == 1) {
	          if(c == 5) { // red
		            o.message('bgcolor', 1, 0, 0, 1);
            } else if(c == 7) { // alpha red
		            o.message('bgcolor', 1, 0, 0, .4);
            } else if(c == 13) {
            } else if(c == 21) { // yellow
		            o.message('bgcolor', 1, 0.93725490196078, 0.2156862745098, 1);
            } else if(c == 43) { // alpha blue
		            o.message('bgcolor', 0, 0, 1, .4);
            } else if(c == 45) { // blue
		            o.message('bgcolor', 0, 0, 1, 1);
            } else if(c == 84) {
            } else if(c == 85) { // dub brown
		            o.message('bgcolor', 0.96078431372549, 0.41960784313725, 0.03921568627451, 1);
            } else if(c == 86) {
            } else if(c == 123) { // alpha green
		            o.message('bgcolor', 0, 1, 0, .4);
	          } else {
		            o.message('bgcolor', 1, 1, 1, 1);
	          }
        } else {
            if(c == 127) { // red
		            o.message('bgcolor', 1, 0, 0, 1);
            } else if(c == 126) { // green 
                o.message('bgcolor', 0, 1, 0, 1);
            } else if(c == 125) { // blue 
		            o.message('bgcolor', 0, 0, 1, 1);
            }
        }
    };

    this.clearAllButtons = function() {
        for(var i=0; i < 8; i++) {
            for(var j=0; j < 8; j++) {
                this.setButton(i, j, 0);
            }
        }
    };
}



// PUSH HARDWARE

    // BLACK = RgbColor(0)
    // DARK_GREY = RgbColor(1)
    // GREY = RgbColor(2)
    // WHITE = RgbColor(3)
    // RED = RgbColor(5)
    // AMBER = RgbColor(9)
    // YELLOW = RgbColor(13)
    // LIME = RgbColor(17)
    // GREEN = RgbColor(21)
    // SPRING = RgbColor(25)
    // TURQUOISE = RgbColor(29)
    // CYAN = RgbColor(33)
    // SKY = RgbColor(37)
    // OCEAN = RgbColor(41)
    // BLUE = RgbColor(45)
    // ORCHID = RgbColor(49)
    // MAGENTA = RgbColor(53)
    // PINK = RgbColor(57)


var DEV_NAME = 'Push';
var PUSH_VERSION = 2;

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

        if(options.ui) {
            this.ui = new UI();
        }
    };

    // keep the live object updated
    this.poll = function() {
        if(this.bLiveAPIInit == false) {
            this.bLiveAPIInit = true;
            if(options.onLiveAPIInit) {
                options.onLiveAPIInit();
                if(this.ui) {
                    this.ui.init();
                }
            }
        }
        var exists = false;
	      for(var i=0; i < 6; i++) {
		        var api = new LiveAPI("control_surfaces " + i);
            if(api.type.indexOf(DEV_NAME) == 0) { // 'Push' & 'Push2'
                var thisId = this.api != null ? this.api.id : null;
                if(this.api && this.api.id == api.id) {
                    exists = true;
                } else if(!this.api || this.api.id != api.id) {
                    this.api = api;
                    var gridId = this.api.call('get_control_by_name', 'Button_Matrix');
                    this.grid = new LiveAPI(function(x, y, z) {
                        if(x[0] == 'value' && x[1] != 'bang' && options.onButtonEvent) {
                            options.onButtonEvent(x[2], x[3], x[1]);
                        }
                    });
                    this.grid.id = gridId[1];
                    this.grid.property = 'value';
                    exists = true;
                    if(this.bPushFound == false) {
                        this.bPushFound = true;
                        PKPushState.bPushFound = true;
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
    };

    this.destroy = function() {
        this.releaseGrid();
        this.dead = true;
    };

    this.setButton = function(x, y, z) {
//        log('Push.setButton', x, y, z);
        if(x < 0 || x > 7 || y < 0 || y > 7 || z < 0 || z > 255) {
            log('Push.setButton() invalid arguments: ' + x + ', ' + y + ', ' + z);
        }
        if(this.gridGrabbed && this.grid) {
            this.grid.call('send_value', x, y, z);
        }
        this.gridData[y][x] = z;
        if(this.ui) {
            this.ui.setButton(x, y, z);
        }
    };

    this.setAllButtons = function(x) {
        for(var i=0; i < 8; i++) {
            for(var j=0; j < 8; j++) {
                this.setButton(i, j, x);
            }
         }
    };

    this.clearAllButtons = function() {
        for(var i=0; i < 8; i++) {
            for(var j=0; j < 8; j++) {
                this.setButton(i, j, 0);
            }
        }
    };

    this.grabGrid = function() {
        if(this.api) {
            this.api.call('grab_control', 'id', this.grid.id);
            this.gridGrabbed = true;
        }
    };

    this.releaseGrid = function() {
        if(this.api) {
            this.api.call('release_control', 'id', this.grid.id);
            this.gridGrabbed = false;
        }
    };

    this.recallData = function() {
        for(var i=0; i < this.gridData.length; i++) {
            var row = this.gridData[i];
            for(var j=0; j < row.length; j++) {
                var x = row[j];
                this.setButton(j, i, x);
            }
        }
    };

    this.setImage = function(data) {
        for(var i=0; i < data.length; i++) {
            var row = data[i];
            for(var j=0; j < row.length; j++) {
                var x = row[j];
                this.setButton(j, i, x);
            }
        }
    };

    this.setPK = function() {
        this.setImage(PK_IMAGE);
    };

    this.init();
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




var app = {

    ui: true,

    onLiveAPIInit: function() {
        PKPushState.bAPIInit = true;
        outlet(0, 'push_api_init');
    },
    onPushFound: function() {
        push.grabGrid();
        push.setImage(PK_IMAGE);
        outlet(0, 'push_found');
    },
    onPushConnected: function() {
        this.track_offset = 0;
        var id = push.api.call('get_component_by_name', 'Session_Ring'); // Thank you Push 2!
        this.Session_Ring = new LiveAPI(function() { }, id);
        function onControl(x) {
            if(x[0] == 'value' && x[1] != 'bang' && x[1] > 0) {
                var value = x[1];
                var name = this.get('name');
                if(name == 'Left_Arrow' || name == 'Right_Arrow') {
                    var track_offset = app.Session_Ring.get('track_offset');
                    if(track_offset != app.track_offset) {
                        app.track_offset = track_offset;
                        outlet(0, 'push_track_offset', app.track_offset)
                    }
                }
            }
        }
        this.Left_Arrow = new LiveAPI(onControl, push.api.call('get_control_by_name', 'Left_Arrow'));
        this.Left_Arrow.property = 'value';
        this.Right_Arrow = new LiveAPI(onControl, push.api.call('get_control_by_name', 'Right_Arrow'));
        this.Right_Arrow.property = 'value';
        outlet(0, 'push_connected');
    },
    onPushDisconnected: function() {
        outlet(0, 'push_disconnected');
    },
    onButtonEvent: function(x, y, velocity) {
        log('onButtonEvent', x, y, velocity);
	      outlet(0, ['push_button', x, y, velocity]);
    },
    
};


var push = new Push(app);


log("_____________________________ pk.push_ui.js: ______________________________");
log("__________________________  pk.push_looper.js: ____________________________");
//log("Reload:", new Date);






//
// public api
//
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

function set_all(c) {
    push.setAllButtons(c);
}

// set button colors
function set(x, y, c) {	
//    log('pk.push_ui.set()', x, y, c);
    push.setButton(x, y, c);
}

// input from UI
function list(index, value) {
    var y = parseInt(index / 8);
    var x = parseInt(index % 8);
	  outlet(0, ['push_button', x, y, 100]);
	  outlet(0, ['push_button', x, y, 0]);
}



