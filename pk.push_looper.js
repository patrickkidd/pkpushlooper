/*
 TODO - critical
 - MIDI input -> looper ctl
 - options:
   - Arm track via MIDI
   - Arm on record (mutually exclusive with Arm track via MIDI?)
   - Arm on push
   - Stop transport on clear all
   - Ingore track (i.e. vocals)
   - Sustain pedal mode
   - clear all button

 TODO - low-pri
 - allow playing piano while looping with bass
 - output visual pulse on loop restart?
 - Push UI doesn't update when looper State changes on it's own.

 FORUMS
 - call js function on [freebang]? Max freezes up...
*/

autowatch = 1;
inlets = 2;
outlets = 2;
PKPushState = new Global('PKPushState');

// constants
STOP_TRANSPORT_ON_CLEAR = true;


function toInt(f) {
    return f | 0;
}

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

function DEBUG() {
}
DEBUG = log;


// Find all matching devices in the live set
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




function LooperManager() {

    function onLooperChange(x) {
        if(manager.bInit && x[0] == 'value' && this.track_index !== undefined) {
//            log('onLooperChange()', x, this.track_index);
            if(this.get('name') == 'State' && x[1] != 0) {
                manager.loopers[this.track_index].bBufferFilled = true;
            }
            manager.paintLooperPart(this.track_index, this.get('name'), x[1]);
        }
    }

    function onLevelMeter(x) {
//        log('onLevelMeter()', x, this.track_index);
        if(this.track_index !== undefined) {
            manager.paintLevelMeter(this, x);
        }
    }

    this.bInit = false;
    this.init = function() {

        if(this.bInit) {
            return;
        }

        this.liveSet = LiveAPI('live_set');

        this.track_offset = 0;

        var foundLoopers = FindDevices({ type: 'Looper' });
        this.loopers = {};
        this.levels = {};

        // queue state
        this.firstLooperStart = null;
        this.firstLooperFinishedRecording = null;

        for(var track in foundLoopers) {
            track = parseInt(track);
            // observe loopers
            var looper = {
                device: new LiveAPI('id ' + foundLoopers[track]),
                bBufferFilled: false,
                track_index: track,
                queuedVelocity: null // set when awaiting another looper
            };
            var parameters = looper.device.get('parameters');
            for(var i=0; i < parameters.length ; i++) {
                if(parameters[i] != 'id') {
                    var param = new LiveAPI(onLooperChange);
                    param.id = parameters[i];
                    if(param.get('name') == 'State') {
                        param.track_index = track;
                        param.looper = looper;
                        looper.state = param;
                        looper.state.property = 'value';
                        looper.state.track_index = track;
                    } else if(param.get('name') == 'Reverse') {
                        param.track_index = track;
                        param.looper = looper;
                        looper.reverse = param;
                        looper.reverse.property = 'value';
                        looper.reverse.track_index = track;
                    }
                }
            }
            this.loopers[track] = looper;
            // observe level meters
            var observer = new LiveAPI(onLevelMeter, 'live_set tracks ' + track);
            observer.property = 'output_meter_left';
            observer.track_index = track;
            this.levels[track] = observer;
        }
        repaintTask.schedule(1);
        this.bInit = true;
    };

    this.setButtonColor = function(x, y, c) {
//        log('Manager.setButtonColor', x, y, c);
        outlet(1, ['set', x, y, c]);
    };

    this.setTrackOffset = function(x) {
        this.track_offset = x;
        this.repaintAll();
    };

    this.paintLooperPart = function(track_index, name, value) {
//        log('Manager.paintLooperPart', track_index, name, value);
        var iTrack = track_index - this.track_offset;
        if(iTrack >= 0 && iTrack <= 7) { // ignore off-screen
            var bBufferFilled = this.loopers[iTrack].bBufferFilled;
            if(name == 'State') {
                if(value == 0) { // stop
                    this.setButtonColor(iTrack, 0, bBufferFilled ? 123 : 0)
                    this.setButtonColor(iTrack, 1, bBufferFilled ? 7 : 0)
                    this.setButtonColor(iTrack, 2, bBufferFilled ? 7 : 0)
                } else if(value == 1) { // rec
                    this.setButtonColor(iTrack, 0, 5)
                    this.setButtonColor(iTrack, 1, 5)
                    this.setButtonColor(iTrack, 2, 7)
                } else if(value == 2) { // play
                    this.setButtonColor(iTrack, 0, 21)
                    this.setButtonColor(iTrack, 1, 5)
                    this.setButtonColor(iTrack, 2, 7)
                } else if(value == 3) { // dub
                    this.setButtonColor(iTrack, 0, 85)
                    this.setButtonColor(iTrack, 1, 5)
                    this.setButtonColor(iTrack, 2, 7)
                }
            } else if(name == 'Reverse') {
                this.setButtonColor(iTrack, 3, parseInt(value) ? 45 : 43); // 43 is light blue;
            }
        }
    };

    this.paintLevelMeter = function(param, x) {
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
                this.setButtonColor(param.track_index + this.track_offset, row, isLit ? color : 0);
            }
        }
    };

    this.repaintAll = function() {
        log('repaintAll');
        outlet(1, 'clear');
        for(var i in this.loopers) {
            var looper = this.loopers[i];
            var state = looper.state.get('value');
            this.paintLooperPart(i, 'State', state);
            var reverse = looper.reverse.get('value');
            this.paintLooperPart(i, 'Reverse', reverse);
        }
    };

    // clear all loopers, reset looper states and message queues
    this.clearAll = function() {
        DEBUG('LooperManager.clearAll()');
        this.firstLooperStart = null;
        this.firstLooperFinishedRecording = null;
        for(var i in this.loopers) {
            i = parseInt(i);
            var looper = this.loopers[i];
            send_note(i + 16);
        }
        if(STOP_TRANSPORT_ON_CLEAR) {
            this.liveSet.call('stop_playing');
        }
        this.repaintAll();
    };

    // 00-07 => transport
    // 08-15 => stop
    // 16-23 => clear
    // 24-31 => reverse
    // 32    => clear all
    this.onMidi = function(note, vel) {
//        log('onMidi', note, vel, this.firstLooperFinishedRecording);
        var iTrack = note % 8;
        var looper = this.loopers[iTrack];
        var row = toInt(note / 8);
        if(note == 32 && vel > 0) { // clear all
            this.clearAll();
        } else if(looper) {
            if(row == 0) { // transport
                if(this.firstLooperStart == null) {
                    if(vel > 0) {
                        DEBUG('*** FIRST RECORD: ' + vel);
                        this.firstLooperStart = iTrack;
                        this.firstLooperFinishedRecording = false;
                        outlet(0, [144, note, vel]);
                        // the respective first note-off gets passed through below
                    }
                } else if(this.firstLooperFinishedRecording == false) {
                    
                    // ^^ now in the time window of recording the first looper ^^
                    
                    if(this.firstLooperStart == iTrack) { // finish rec.
                        if(vel > 0) {
                            DEBUG('*** FIRST FINISHED: ' + vel);
                            this.firstLooperFinishedRecording = true;
                            // First looper is going to finish its
                            // initial recording.  So trigger all
                            // queued loopers just *before* the first
                            // one gets its note out. This is
                            // (clearly) only run from the first
                            // looper.
                            for(var i in this.loopers) {
                                i = parseInt(i);
                                var looper = this.loopers[i];
                                if(i != iTrack && looper.queuedVelocity != null) {
                                    DEBUG('*** STARTING:', i, looper.queuedVelocity);
                                    send_note(i, looper.queuedVelocity);
                                    looper.queuedVelocity = null;
                                }
                            }
                        }
                        outlet(0, [144, note, vel]);
                    } else if(this.firstLooperStart != iTrack && vel > 0) {
                        // second looper queueing it's start
                        DEBUG('*** QUEUING: ', iTrack, ', ', vel);
                        var looper = this.loopers[iTrack];
                        looper.queuedVelocity = vel;
                        // TODO: flash transport button on push grid
                    }

                    // ignore note-off here

                } else {
                    // pass-through
                    log('pass-through', note, vel);
				            outlet(0, [144, note, vel]);
                }
            } else if(row == 1) { // stop
				        outlet(0, [144, note, vel]);
            } else if(row == 2) { // clear
                looper.bBufferFilled = false;
				        outlet(0, [144, note, vel]);
                this.paintLooperPart(iTrack, 'State', 0); // no idea
            } else if(row == 3) { // reverse
				        outlet(0, [144, note, vel]);
            }
        }
    };


};


log("__________________________  pk.push_looper.js: ____________________________");

var manager = new LooperManager();


function push_api_init() {
    log('pk.push_looper.push_api_init()');
    PKPushState.bAPIInit = true;
    manager.init();
}

/*
var repaintRepeatTask = new Task(function() {
    manager.repaintAll();
    post('repaintRepeatTask');
});
repaintRepeatTask.interval = 2000;
repaintRepeatTask.repeat();
*/

var repaintTask = new Task(function() {
    manager.repaintAll();
});
function push_found() {
    log('pk.push_looper.push_found()');
    repaintTask.schedule(1);
}

function push_connected() {
}

function push_disconnected() {
}

function push_track_offset(x) {
    log('pk.push_track_offset()', x);
    manager.setTrackOffset(x);
}

// midi input
// This device acts as a midi filter so that we can send midi from the
// push grid just as is sent from the pedalboard. Also that way we can
// do things in sync with looper states, like queue and start other
// loopers.
function midi(note, vel) {
    manager.onMidi(note, vel);
}



function push_button(x, y, velocity) {
    log('pk.push_looper.push_button()', x, y, velocity);
    var iTrack = x - manager.track_offset;
    var looper = manager.loopers[iTrack];
    if(looper) {
        // send midi: 144 : note, 176 : cc
        if(y == 0) { // transport
            manager.onMidi(iTrack, velocity);
        } else if(y == 1) { // stop
            manager.onMidi(iTrack + 8, velocity);
        } else if(y == 2) { // clear
            manager.onMidi(iTrack + 16, velocity);
        } else if(y == 3) { // reverse
            manager.onMidi(iTrack + 24, velocity);
			  }
    }
}

function send_note(note, vel) {
    if(vel == undefined) {
        vel = 100;
    }
    outlet(0, [144, note, vel]);
    outlet(0, [144, note, 0]);
}

// dev
if(PKPushState.bAPIInit) {
    push_api_init();
}
if(PKPushState.bPushFound) {
    push_found();
}
