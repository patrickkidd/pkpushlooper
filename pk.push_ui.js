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

    // map the 4 x 4 x 4 x 4 grids into index order
    // cause its easier to paint them by quadrant
    var _order = [
	      0, 1, 2, 3,
	      8, 9, 10, 11,
	      16, 17, 18, 19,
	      24, 25, 26, 27,
	      
	      4, 5, 6, 7,
	      12, 13, 14, 15,
	      20, 21, 22, 23,
	      28, 29, 30, 31,
	      
	      32, 33, 34, 35,
	      40, 41, 42, 43,
	      48, 49, 50, 51,
	      56, 57, 58, 59,
	      
	      36, 37, 38, 39,
	      44, 45, 46, 47,
	      52, 53, 54, 55,
	      60, 61, 62, 63
    ];

    var BUTTON_SIZE = 50;
	  var MARGIN = 2;
    this.buttons = [];
    this.prepends = [];
    var that = this;

    function chunk(x, y) {
	      for(var i=0; i < 4; i++) {
		        for(var j=0; j < 4; j++) {
			          var o = _patcher.newobject("toggle",
                                          j * BUTTON_SIZE + x,
                                          i * BUTTON_SIZE + y,
                                          BUTTON_SIZE,
                                          BUTTON_SIZE);
			          o.message('checkedcolor', 0, 0, 0, 0);
			          o.message('presentation', 1);
			          that.buttons.push(o);
			          o.index = _order[that.count];
			          o.varname = 'pk_' + o.index;
			          that.count++;
		        }
	      }
    }

    this.init = function() {
	      
	      // clear all buttons
	      var o = _patcher.firstobject;
	      while(o) {
            //		post(o.maxclass + ',' + (o.varname.indexOf('pk_') == 0) + '\n');
		        if((o.maxclass == 'toggle' && o.varname.indexOf('pk_') == 0) ||
		           (o.maxclass == 'prepend' && o.varname.indexOf('pkprepend_') == 0)) {
			          var was = o;
			          o = was.nextobject;
			          _patcher.remove(was);
		        } else {
			          o = null;
		        }
	      }
	      this.buttons = [];
	      
        this.count = 0;
	      chunk(0, 0);
	      chunk(BUTTON_SIZE * 4 + MARGIN, 0);
	      chunk(0, BUTTON_SIZE * 4 + MARGIN);
	      chunk(BUTTON_SIZE * 4 + MARGIN, BUTTON_SIZE * 4 + MARGIN);
	      this.buttons.sort(function(a, b) {
		        return a.index - b.index;
	      });
	      
	      this.prepends = [];
	      for(var i=0; i < this.buttons.length; i++) {
		        var o = this.buttons[i];
		        var prepend = _patcher.newdefault(500, 500, "prepend", i);
		        _patcher.connect(o, 0, prepend, 0);
		        _patcher.connect(prepend, 0, _patcher.getnamed('mine'), 0);
		        prepend.varname = 'pkprepend_' + i;
		        this.prepends.push(prepend);
	      }
    };

    this.setButton = function(x, y, c) {
	      var i = x + y * 8;
	      var o = this.buttons[i];
	      if(!o) {
		        return;
	      };
//        log('UI.setButton', x, y, c);
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


var DEV_NAME = 'Push';

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
            if(api.type == DEV_NAME) {
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
        outlet(0, 'push_api_init');
    },
    onPushFound: function() {
        push.grabGrid();
        push.setImage(PK_IMAGE);
        outlet(0, 'push_found');
    },
    onPushConnected: function() {
        this.session_component = null;
        this.track_offset = 0;
        var pollSessionTask = new Task(function() {
            var x = push.api.call('highlighting_session_component');
            if(x[0] == 'id' && x[1] != 0) {
                app.session_component = new LiveAPI('id ' + x[1]);
            }
        });
        pollSessionTask.schedule(0);
        function onControl(x) {
            if(x[0] == 'value' && x[1] != 'bang' && x[1] > 0) {
                var value = x[1];
                var name = this.get('name');
                if(name == 'Left_Arrow' || name == 'Right_Arrow') {
                    if(app.session_component) {
                        var track_offset = app.session_component.call('track_offset');
                        if(track_offset != app.track_offset) {
                            app.track_offset = track_offset;
                            outlet(0, 'push_track_offset', app.track_offset)
                        }
                    }
                } else if(name == 'Session_Mode_Button' || name == 'Note_Mode_Button') {
                    // created upon entering session mode
                    if(app.session_component == null) {
                        pollSessionTask.schedule(0); // defer ctor
                    }
                }
            }
        }
        var names = ['Left_Arrow', 'Right_Arrow', 'Session_Mode_Button', 'Note_Mode_Button'];
        for(var k in names) {
            this[names[k]] = null;
        }
        var ctl = null;
        var controls = push.api.get('controls');
        for(var i=0; i < controls.length; i++) {
            var x = controls[i];
            if(x != 'id') {
                if(ctl == null) {
                    ctl = new LiveAPI(onControl);
                }
                ctl.id = x;
                var name = ctl.get('name');
                for(var k in names) {
                    if(names[k] == name) {
                        ctl.property = 'value'
                        this[name] = ctl;
                        ctl = null;
                    }
                }
            }
        }
        outlet(0, 'push_connected');
    },
    onPushDisconnected: function() {
        outlet(0, 'push_disconnected');
    },
    onButtonEvent: function(x, y, velocity) {
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



