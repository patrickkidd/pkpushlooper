
autowatch = 1;
inlets = 2;
outlets = 2;
PKPushState = new Global('PKPushState');

// constants
STOP_TRANSPORT_ON_CLEAR = true;
ARM_TRACK_ON_RECORD = true;

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
//DEBUG = log;


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


    // just check a little time after the live api might be initialized
    // in case we are in js dev mode and no [live.thisdevice] bang is coming.
    // if a [live.thisdevice] bang already came then running it again won't hurt.
    this.initDefered = function() {
        this.initTask = new Task(function() {
            manager.init();
        });
        this.initTask.schedule(500);
    };
    this.initDefered();

    this.bInit = false;
    this.init = function() {

        if(this.bInit) {
            this.repaintAll();
            return;
        }

        log('LooperManager.init');

        this.liveSet = LiveAPI('live_set');
        this.liveSetView = LiveAPI('live_set view');

        this.flashingButtons = {};
        this.flashingTimer = new Task(function() {
            var nKeys = Object.keys(manager.flashingButtons).length;
            if(nKeys == 0) {
                return;
            }
//            log('flashingTimer', manager.flashingButtons);
            for(var i in manager.flashingButtons) {
                var b = manager.flashingButtons[i];
                if(b.isOn) {
                    manager.setButton(b.x, b.y, 0);
                    b.isOn = false;
                } else {
                    manager.setButton(b.x, b.y, b.c);
                    b.isOn = true;
                }
            };
        });
        this.flashingTimer.interval = 500;
        this.flashingTimer.repeat();

        this.track_devices = {};
        var iTracks = this.liveSet.getcount('tracks');
        for(var i=0; i < iTracks; i++) {
            if(i < 8) {
                var device = new LiveAPI('live_set tracks ' + i);
                this.track_devices[i] = device;
            }
        }

        this.track_offset = 0;

        var foundLoopers = FindDevices({ type: 'Looper' });
        this.loopers = {};
        this.levels = {};
        this.ignore_track = null;

        // queue state
        this.firstLooperStart = null;
        this.firstLooperFinishedRecording = null;

        for(var track in foundLoopers) {
            track = parseInt(track);
            // observe loopers
            var looper = {
                device: new LiveAPI('id ' + foundLoopers[track]),
                track_device: new LiveAPI('live_set tracks ' + track),
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
        this.repaintAll();
        this.bInit = true;
    };

    this.setButton = function(x, y, c) {
//        log('LooperManager.setButton', x, y, c);
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
                    this.setButton(iTrack, 0, bBufferFilled ? 123 : 0)
                    this.setButton(iTrack, 1, bBufferFilled ? 7 : 0)
                    this.setButton(iTrack, 2, bBufferFilled ? 7 : 0)
                } else if(value == 1) { // rec
                    this.setButton(iTrack, 0, 5)
                    this.setButton(iTrack, 1, 5)
                    this.setButton(iTrack, 2, 7)
                } else if(value == 2) { // play
                    this.setButton(iTrack, 0, 21)
                    this.setButton(iTrack, 1, 5)
                    this.setButton(iTrack, 2, 7)
                } else if(value == 3) { // dub
                    this.setButton(iTrack, 0, 85)
                    this.setButton(iTrack, 1, 5)
                    this.setButton(iTrack, 2, 7)
                }
            } else if(name == 'Reverse') {
                this.setButton(iTrack, 3, parseInt(value) ? 45 : 43); // 43 is light blue;
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
                this.setButton(param.track_index + this.track_offset, row, isLit ? color : 0);
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
            looper.bBufferFilled = false;
            send_note(i + 8); // stop
            send_note(i + 16); // clear
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
    this.onMidiNote = function(note, vel) {
//        log('onMidiNote', note, vel, this.firstLooperFinishedRecording);
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
                        if(ARM_TRACK_ON_RECORD) {
                            this.armTrack(iTrack);
                        }
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
                                    this.stopFlashingButton(i, 0);
                                    looper.queuedVelocity = null;
                                    if(ARM_TRACK_ON_RECORD) {
                                        this.armTrack(i);
                                    }
                                }
                            }
                        }
                        outlet(0, [144, note, vel]);
                    } else if(this.firstLooperStart != iTrack && vel > 0) {
                        // second looper queueing it's start
                        DEBUG('*** QUEUING: ', iTrack, ', ', vel);
                        var looper = this.loopers[iTrack];
                        looper.queuedVelocity = vel;
                        this.startFlashingButton(iTrack - this.track_offset, 0, 5);
                    }

                    // ignore note-off here

                } else {
                    // pass-through
                    if(vel > 0 && ARM_TRACK_ON_RECORD) {
                        this.armTrack(iTrack);
                    }
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
        } else if(!looper) {
            // extant track but no looper
            if(ARM_TRACK_ON_RECORD) {
                this.armTrack(iTrack);
            }
        }
    };

    this.onMidiCC = function(num, value) {
        if(num == 63) { // sustain
        }
    };

    this.armTrack = function(iTrack, exclusive) {
        if(iTrack == this.ignore_track) { // i.e. vocals
            return;
        }
        if(exclusive === undefined) {
            exclusive = true;
        }
        for(var i in this.track_devices) {
            var dev = this.track_devices[i];
            i = parseInt(i);
            if(i != iTrack && exclusive) {
                dev.set('arm', 0);
            } else {
                dev.set('arm', 1);
            }
        }
    };

    // TODO: replace with instrument groups
    this.setIgnoreTrack = function(iTrack) {
        this.ignore_track = parseInt(iTrack);
    };

    this.startFlashingButton = function(x, y, c) {
        if(x < 0 || x >= 8) { // track_offset
            return;
        }
        var i = x + y * 8;
        this.flashingButtons[i] = { x: x, y: y, c: c, isOn: false };
        log('stopFlashingButton: this.setButton', x, y, 0);
        this.setButton(x, y, 0);
    };

    this.stopFlashingButton = function(x, y) {
        if(x < 0 || x >= 8) { // track_offset
            return;
        }
        var i = x + y * 8;
        var b = this.flashingButtons[i];
        delete this.flashingButtons[i];
        log('stopFlashingButton: this.setButton', b);
        this.setButton(b.x, b.y, b.c);
    };

};


log("__________________________  pk.push_looper.js: ____________________________");

var manager = new LooperManager();


function push_api_init() {
    log('pk.push_looper.push_api_init()');
    manager.init();
}

function push_found() {
    log('pk.push_looper.push_found()');
    // update the push
    manager.repaintAll();
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
function midi_note(note, vel) {
    manager.onMidiNote(note, vel);
}

function midi_cc(num, val) {
    manager.onMidiCC(num, val);
}


function clear_all() {
    manager.clearAll();
}

function set_arm_track_on_record(x) {
    ARM_TRACK_ON_RECORD = x && true;
}

function set_ignore_track(x) {
    manager.setIgnoreTrack(x);
}


function push_button(x, y, velocity) {
//    log('pk.push_looper.push_button()', x, y, velocity);
    var iTrack = x - manager.track_offset;
    var looper = manager.loopers[iTrack];
    if(looper) {
        // send midi: 144 : note, 176 : cc
        if(y == 0) { // transport
            manager.onMidiNote(iTrack, velocity);
        } else if(y == 1) { // stop
            manager.onMidiNote(iTrack + 8, velocity);
        } else if(y == 2) { // clear
            manager.onMidiNote(iTrack + 16, velocity);
        } else if(y == 3) { // reverse
            manager.onMidiNote(iTrack + 24, velocity);
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

