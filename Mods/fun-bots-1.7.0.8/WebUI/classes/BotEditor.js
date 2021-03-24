let Language = {};

const BotEditor = (new function BotEditor() {
	const DEBUG				= true;
	const VERSION			= '1.0.0-Beta';
	let _language			= 'en_US';
	
	this.__constructor = function __constructor() {
		console.log('Init BotEditor UI (v' + VERSION + ') by https://github.com/Bizarrus.');

		/* Fix Views */
		[].map.call(document.querySelectorAll('ui-view'), function(view) {
			view.dataset.show = false;
		}.bind(this));
		
		/* Coloring */
		[].map.call(document.querySelectorAll('ui-box'), function(box) {
			var prop	= window.getComputedStyle(box).getPropertyValue('background-image');
			var re		= /url\((['"])?(.*?)\1\)/gi;
			var images	= [];
			var matches;
			
			while ((matches = re.exec(prop)) !== null) {
				images.push(matches[2]);
			}
			
			this.imagesHandler(images, function(results) {
				let build = [];
				
				results.forEach(function(entry) {
					build.push('url(' + entry + ')');
				});
				
				box.style.backgroundImage = build.join(', ');
			});
		}.bind(this));
		
		this.bindMouseEvents();
		this.bindKeyboardEvents();
	};
	
	this.Hide = function Hide() {
		this.hide('toolbar');
	};
	
	this.imagesHandler = function imagesHandler(images, callback) {
		let finished = 0;
		
		images.forEach(function(image, index) {
			this.imageHandler(image, function(result) {
				images[index] = result;
				++finished;
			});
		}.bind(this));
		
		let _watcher = setInterval(function() {
			if(images.length == finished) {
				clearInterval(_watcher);
				callback(images);
				return;
			}	
		});
	};
	
	this.buildColor = function buildColor(string) {
		// RGB
		if(string.indexOf(',') > -1) {
			let parts = string.split(',');
			
			if(parts.length == 3) {
				return 'rgb(' + parts.join(', ') + ')';
				
			// With Alpha-Transparency
			} else if(parts.length == 4) {
				return 'rgba(' + parts.join(', ') + ')';
			}
		
		// HEX
		} else {
			return '#' + string;
		}
	};
	
	this.imageHandler = function imageHandler(url, callback) {
		let image			= new Image();
		image.src			= url;
		image.crossOrigin	= 'Anonymous';
		image.onload		= function onLoad() {
			let color			= url.split('#')[1];
			let canvas			= document.createElement('canvas');
			var context			= canvas.getContext('2d');
			canvas.width		= image.width;
			canvas.height		= image.height;
			context.fillStyle	= this.buildColor(color);
			context.fillRect(0, 0, canvas.width, canvas.height);
			context.globalCompositeOperation = 'destination-in';
			context.drawImage(image, 0, 0);
			callback(canvas.toDataURL('image/png'));
		}.bind(this);
	};

	this.bindMouseEvents = function bindMouseEvents() {
		document.body.addEventListener('mouseover', function onMouseDown(event) {
			if(!event) {
				event = window.event;
			}

			var parent = Utils.getClosest(event.target, '[data-description]');

			if(typeof(parent) == 'undefined') {
				return;
			}

			document.querySelector('ui-description').innerHTML = parent.dataset.description;
		});

		document.body.addEventListener('mouseout', function onMouseDown(event) {
			if(!event) {
				event = window.event;
			}

			var parent = Utils.getClosest(event.target, '[data-description]');

			if(typeof(parent) == 'undefined') {
				return;
			}

			document.querySelector('ui-description').innerHTML = '';
		});

		document.body.addEventListener('mousedown', function onMouseDown(event) {
			if(!event) {
				event = window.event;
			}

			var parent = Utils.getClosest(event.target, '[data-action]');

			if([
				'INPUT'
			].indexOf(event.target.nodeName) >= 0) {
				if(DEBUG) {
					console.warn('Parent is an form element!', parent);
				}

				return;
			}

			if(typeof(parent) == 'undefined') {
				if(DEBUG) {
					console.warn('Parent is undefined', parent);
				}

				return;
			}

			if(DEBUG) {
				console.log('CLICK', parent.dataset.action);
			}

			if (parent.dataset.action.startsWith('UI_CommoRose_Action_')) {
				WebUI.Call('DispatchEventLocal', parent.dataset.action);
			}

			switch(parent.dataset.action) {
				/* Restore all values to default */
				case 'restore':
					[].map.call(Utils.getClosest(event.target, 'ui-view').querySelectorAll('ui-entry'), function(entry) {
						entry.resetToDefault();
					});
				break;
				
				/* Exit */
				case 'exit':
					WebUI.Call('DispatchEventLocal', 'UI_Toggle');
				break;
				case 'close':
					/* Check if some Views visible */
					let views_opened = 0;
					
					[].map.call(document.querySelectorAll('ui-view'), function(view) {
						if(view.dataset.show && view.dataset.name != 'toolbar') {
							++views_opened;
						}
					});
					
					/* Close completely if only one view is visible */
					if(views_opened == 1) {
						WebUI.Call('DispatchEventLocal', 'UI_Toggle');
						return;
					}
					
					/* Otherwise hide current view */
					let view	= Utils.getClosest(event.target, 'ui-view');
					this.hide(view.dataset.name);
					
					/* Close by password */
					if(view.dataset.name == 'password') {
						WebUI.Call('DispatchEventLocal', 'UI_Toggle');
					}
				break;

				/* Bots */
				case 'bot_spawn_default':
					count = document.querySelector('[data-action="bot_spawn_default"] input[type="number"]');
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_spawn_default',
						value:	count.value
					}));
					count.value = 1;
				break;
				case 'bot_spawn_friend':
					count = document.querySelector('[data-action="bot_spawn_friend"] input[type="number"]');
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_spawn_friend',
						value:	count.value
					}));
					count.value = 1;
				break;
				case 'bot_spawn_path':
					index = document.querySelector('[data-action="bot_spawn_path"] input[type="number"]');
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_spawn_path',
						value:	index.value
					}));
				break;
				case 'bot_kick_all':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_kick_all'
					}));
				break;
				case 'bot_kick_team':
					count = document.querySelector('[data-action="bot_kick_team"] input[type="number"]');
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_kick_team',
						value:	count.value
					}));
					count.value = 1;
				break;
				case 'bot_kill_all':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_kill_all'
					}));
				break;
				case 'bot_respawn':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_respawn'
					}));
				break;
				case 'bot_attack':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_attack'
					}));
				break;

				/* Trace */
				case 'trace_start':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_start'
					}));
				break;
				case 'trace_end':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_end',
					}));
				break;
				case 'trace_save':
					index = document.querySelector('input[type="number"][name="trace_index"]');
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_save',
						value: index.value
					}));
				break;
				case 'trace_clear':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_clear'
					}));
				break;
				case 'trace_reset_all':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_reset_all'
					}));
				break;
				case 'waypoints_client_load':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'waypoints_client_load'
					}));
				break;
				case 'waypoints_client_save':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'waypoints_client_save'
					}));
				break;
				case 'waypoints_server_load':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'waypoints_server_load'
					}));
				break;
				case 'waypoints_server_save':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'waypoints_server_save'
					}));
				break;
				case 'trace_show':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_show'
					}));
				break;
				
				/* Waypoint-Editor */
				case 'request_waypoints_editor':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'request_waypoints_editor'
					}));
				break;
				case 'back':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'hide_waypoints_editor'
					}));
				break;

				/* Settings */
				case 'request_settings':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'request_settings',
						opened:	this.isVisible('settings')
					}));
				break;

				case 'submit_settings_temp':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'submit_settings_temp'
					}));
				break;

				case 'submit_settings':
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'submit_settings'
					}));
				break;

				/* Other Stuff */
				default:
					let entry;
					
					switch(event.target.nodeName) {
						case 'UI-RESTORE':
							entry = Utils.getClosest(event.target, 'ui-entry');
							
							entry.resetToDefault();
						break;
						case 'UI-ARROW':
							entry = Utils.getClosest(event.target, 'ui-entry');

							switch(event.target.dataset.direction) {
								case 'left':
									entry.onPrevious();
								break;
								case 'right':
									entry.onNext();
								break;
							}
						break;
					}

					/* Sumbit Forms */
					if(parent.dataset.action.startsWith('submit')) {
						let form	= Utils.getClosest(event.target, 'ui-view').querySelector('[data-type="form"]');
						let action	= form.dataset.action;
						let data	= {
							subaction: null
						};

						if(parent.dataset.action.startsWith('submit_')) {
							data.subaction = parent.dataset.action.replace('submit_', '');
						}

						[].map.call(form.querySelectorAll('input[type="text"], input[type="password"]'), function onInputEntry(input) {
							if(typeof(input.name) !== 'undefined' && input.name.length > 0) {
								data[input.name] = input.value;
							}
						});

						/* UI-Entrys :: Boolean */
						[].map.call(form.querySelectorAll('ui-entry[data-type="Boolean"]'), function onInputEntry(input) {
							if(typeof(input.dataset.name) !== 'undefined' && input.dataset.name.length > 0) {
								data[input.dataset.name] = (input.querySelector('ui-text').innerHTML == 'Yes');
							}
						});

						/* UI-Entrys :: List */
						[].map.call(form.querySelectorAll('ui-entry[data-type="List"]'), function onInputEntry(input) {
							if(typeof(input.dataset.name) !== 'undefined' && input.dataset.name.length > 0) {
								data[input.dataset.name] = input.querySelector('ui-text').innerHTML;
							}
						});

						/* UI-Entrys :: Integer, Float, Text & Password */
						[].map.call(form.querySelectorAll('ui-entry[data-type="Integer"], ui-entry[data-type="Float"], ui-entry[data-type="Text"], ui-entry[data-type="Password"]'), function onInputEntry(input) {
							if(typeof(input.dataset.name) !== 'undefined' && input.dataset.name.length > 0) {
								data[input.dataset.name] = input.querySelector('input').value;
							}
						});

						WebUI.Call('DispatchEventLocal', action, JSON.stringify(data));
					}
				break;
			}
		}.bind(this));
	};

	this.bindKeyboardEvents = function bindKeyboardEvents() {
		document.body.addEventListener('keydown', function onMouseDown(event) {
			let count;

			switch(event.keyCode || event.which) {
				/* Forms */
				case InputDeviceKeys.IDK_Enter:
					let form	= Utils.getClosest(event.target, 'ui-view');
					let submit	= form.querySelector('[data-action="submit"]');

					if(typeof(submit) !== 'undefined') {
						var clickEvent = document.createEvent('MouseEvents');
						clickEvent.initEvent('mousedown', true, true);
						submit.dispatchEvent(clickEvent);
					}

					// @ToDo get to next input and calculate the submit-end
				break;

				/* Bots */
				case InputDeviceKeys.IDK_F2:
					count = document.querySelector('[data-action="bot_spawn_default"] input[type="number"]');
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_spawn_default',
						value:	count.value
					}));
					count.value = 1;
				break;
				case InputDeviceKeys.IDK_F3:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_kick_all'
					}));
				break;
				case InputDeviceKeys.IDK_F4:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'bot_kill_all'
					}));
				break;

				/* Trace */
				case InputDeviceKeys.IDK_F5:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_start'
					}));
				break;
				case InputDeviceKeys.IDK_F6:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_end'
					}));
				break;
				case InputDeviceKeys.IDK_F7:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_clear'
					}));
				break;
				case InputDeviceKeys.IDK_F8:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'trace_reset_all'
					}));
				break;
				case InputDeviceKeys.IDK_F9:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'waypoints_server_save'
					}));
				break;
				case InputDeviceKeys.IDK_F11:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'waypoints_server_load'
					}));
				break;

				/* Settings */
				case InputDeviceKeys.IDK_F10:
					WebUI.Call('DispatchEventLocal', 'BotEditor', JSON.stringify({
						action:	'request_settings',
						opened:	this.isVisible('settings')
					}));
				break;

				/* Exit */
				case InputDeviceKeys.IDK_F12:
					WebUI.Call('DispatchEventLocal', 'UI_Toggle');
				break;

				/* Debug */
				default:
					if(DEBUG) {
						console.warn('Unknown/Unimplemented KeyCode', event.keyCode || event.which);
					}
				break;
			}
		}.bind(this));
	};

	this.openSettings = function openSettings(data) {
		let json;
		let container = document.querySelector('ui-view[data-name="settings"] figure');

		try {
			json = JSON.parse(data);
		} catch(e) {
			console.error(e, data);
			return;
		}

		/* Clear/Remove previous Data */
		[].map.call(container.querySelectorAll('ui-tab[class]'), function(element) {
			element.innerHTML = '';
		});

		json.forEach(function onEntry(entry) {
			let element	= container.querySelector('ui-tab[class="' + entry.category + '"]');
			let output	= new EntryElement();

			output.setType(entry.types);
			output.setName(entry.name);
			output.setTitle(entry.title);
			output.setValue(entry.value);
			output.setDefault(entry.default);
			output.setDescription(entry.description);

			switch(entry.types) {
				case EntryType.List:
					output.setList(entry.list);
				break;
				case EntryType.Boolean:
				case EntryType.Float:
				case EntryType.Integer:
				case EntryType.Text:
				case EntryType.Password:

				break;
			}

			element.appendChild(output.getElement());
		});
	};

	/* Translate */
	this._createLanguage = function _createLanguage(url, success, error) {
		let script	= document.createElement('script');
		script.type	= 'text/javascript';
		script.src	= url;

		script.onload = function onLoad() {
			success();
		}.bind(this);

		script.onerror = function onError() {
			error();
		}.bind(this);

		document.body.appendChild(script);
	};
	
	this.loadLanguage = function loadLanguage(string) {
		if(DEBUG) {
			console.log('Trying to loading language file:', string);
		}
		
		this._createLanguage('languages/' + string + '.js', function onSuccess() {
			if(DEBUG) {
				console.log('Language file was loaded:', string);
			}
			
			_language = string;

			this.reloadLanguageStrings();
		}.bind(this), function onError() {
			this._createLanguage('https://min.gitcdn.link/repo/Joe91/fun-bots/fun-bots-bizzi/WebUI/languages/' + string + '.js', function() {
				if(DEBUG) {
					console.log('Language file was loaded:', string);
				}
				
				_language = string;

				this.reloadLanguageStrings();
			}, function onSuccess() {
				if(DEBUG) {
					console.log('Fallback-Language file was loaded:', string);
				}
				
				_language = string;

				this.reloadLanguageStrings();
			}.bind(this), function onSuccess() {
				if(DEBUG) {
					console.log('Language & Fallback file was not exists:', string);
				}
				
				this.reloadLanguageStrings();
			}.bind(this));
		}.bind(this));		
	};

	this.reloadLanguageStrings = function reloadLanguageStrings() {
		[].map.call(document.querySelectorAll('[data-lang]'), function(element) {
			element.innerHTML = this.I18N(element.dataset.lang);
		}.bind(this));
	};

	this.I18N = function I18N(string) {
		if(DEBUG) {
			let translated = null;

			try {
				translated = Language[_language][string];
			} catch(e){}

			console.log('[Translate]', _language, '=', string, 'to', translated);
		}

		/* If Language exists */
		if(typeof(Language[_language]) !== 'undefined') {
			/* If translation exists */
			if(typeof(Language[_language][string]) !== 'undefined') {
				return Language[_language][string];
			}
		}

		return string;
	};

	this.updateTraceIndex = function updateTraceIndex(index) {
		document.querySelector('input[type="number"][name="trace_index"]').value = index;		
	};

	this.updateTraceWaypoints = function updateTraceWaypoints(count) {
		console.log('updateTraceWaypoints', count);
		document.querySelector('ui-value[data-name="waypoints"]').innerHTML = count;		
	};

	this.updateTraceWaypointsDistance = function updateTraceWaypointsDistance(distance) {
		console.log('updateTraceWaypointsDistance', distance);
		document.querySelector('ui-value[data-name="distance"]').innerHTML = distance;		
	};
	
	this.toggleTraceRun = function toggleTraceRun(state) {
		console.log('toggleTraceRun', state);
		let element		= document.querySelector('[data-action="trace_start"], [data-action="trace_end"]');
		let info		= document.querySelector('ui-box[data-name="record"]');
		let a			= element.querySelector('a');
		let icon		= a.querySelector('i');
		let text		= a.querySelector('span');
		
		if(state) {
			a.dataset.key			= 'F6';
			icon.dataset.name		= 'stop';
			text.dataset.lang		= 'End Trace';
			text.innerHTML			= this.I18N('End Trace');
			info.dataset.show		= true;
			element.dataset.action	= 'trace_end';
		} else {
			a.dataset.key			= 'F5';
			icon.dataset.name		= 'start';	
			text.dataset.lang		= 'Start Trace';
			text.innerHTML			= this.I18N('Start Trace');
			info.dataset.show		= false;
			element.dataset.action	= 'trace_start';
		}
	};

	this.getView = function getView(name) {
		return document.querySelector('ui-view[data-name="' + name + '"]');
	};

	this.show = function show(name) {
		if(DEBUG) {
			console.log('Show View: ', name);
		}

		let view = this.getView(name);

		view.dataset.show = true;
		//view.setAttribute('data-show', 'true');

		switch(name) {
			/* Reset Error-Messages & Password field on opening */
			case 'password':
				view.querySelector('ui-error').innerHTML				= '';
				let password		= view.querySelector('input[type="password"]');
				password.value		= '';
				password.focus();
			break;
		}
	};

	this.setOperationControls = function setOperationControls(data) {
		let json;
		let container = document.querySelector('ui-help[data-name="numpad"]');

		try {
			json = JSON.parse(data);
		} catch(e) {
			console.error(e, data);
			return;
		}

		if (json.Numpad) {
			json.Numpad.forEach(function(entry) {
				let keyElement = document.querySelector('ui-entry[data-grid="'+entry.Grid+'"] ui-key');
				let spanElement = document.querySelector('ui-entry[data-grid="'+entry.Grid+'"] span');
				keyElement.dataset.name = entry.Key
				spanElement.dataset.lang = entry.Name
				spanElement.innerHTML = entry.Name
			});
		}

		if (json.Other) {
			let otherKeysElement = document.querySelector('ui-entry[data-grid="Other"]');
			while (otherKeysElement.hasChildNodes()) {  
				otherKeysElement.removeChild(otherKeysElement.firstChild);
			}
			
			json.Other.forEach(function(entry) {
				let entryElement = document.createElement('ui-entry');
				let keyElement = document.createElement('ui-key');
				keyElement.dataset.name = entry.Key

				let spanElement = document.createElement('span');
				spanElement.dataset.lang = entry.Name
				spanElement.innerHTML = entry.Name

				entryElement.appendChild(keyElement);
				entryElement.appendChild(spanElement);
				otherKeysElement.appendChild(entryElement);
			});
		}

	};
	
	this.setCommonRose = function setCommonRose(data) {
		let state	= false;
		
		if(data === false) {
			this.hide('commorose');
			
			if(state) {
				this.show('toolbar');
			} else {
				this.hide('toolbar');
			}
			return;
		}
		
		let json;
		let container = document.querySelector('ui-view[data-name="commorose"]');

		try {
			json = JSON.parse(data);
		} catch(e) {
			console.error(e, data);
			return;
		}
		
		/* Top */
		let top = container.querySelector('ui-top span');
		
		if(json.Top) {
			if(json.Top.Action) {
				top.dataset.action = json.Top.Action;
			}
			
			if(json.Top.Label) {
				top.innerHTML = json.Top.Label;
			}
		} else {
			top.dataset.action	= '';
			top.innerHTML		= '';
		}
		
		/* Bottom */
		let bottom = container.querySelector('ui-bottom span');
		
		if(json.Bottom) {
			if(json.Bottom.Action) {
				bottom.dataset.action = json.Bottom.Action;
			}
			
			if(json.Bottom.Label) {
				bottom.innerHTML = json.Bottom.Label;
			}
		} else {
			bottom.dataset.action	= '';
			bottom.innerHTML		= '';
		}
		
		/* Center */
		let center = container.querySelector('ui-hexagon');
		
		if(json.Center) {
			if(json.Center.Action) {
				center.dataset.action = json.Center.Action;
			}
			
			if(json.Center.Label) {
				center.innerHTML = json.Center.Label;
			}
		} else {
			center.dataset.action	= '';
			center.innerHTML		= '';
		}
		
		/* Left */
		let left			= container.querySelector('ul.left');
		left.innerHTML		= '';
		
		if(json.Left) {
			json.Left.forEach(function(entry) {
				let element				= document.createElement('li');
				element.innerHTML		= (entry.Label ? '<a><span>' + entry.Label + '</span></a>' : '<a><span></span></a>');
				element.dataset.action	= entry.Action;
				left.appendChild(element);
			});
		}
		
		/* Right */
		let right			= container.querySelector('ul.right');
		right.innerHTML		= '';
		
		if(json.Right) {
			json.Right.forEach(function(entry) {
				let element				= document.createElement('li');
				element.innerHTML		= (entry.Label ? '<a><span>' + entry.Label + '</span></a>' : '<a><span></span></a>');
				element.dataset.action	= entry.Action;
				right.appendChild(element);
			});
		}
		
		state = this.isVisible('toolbar');
		
		if(state) {
			this.hide('toolbar');
		}
		
		this.show('commorose');
	};

	this.isVisible = function isVisible(name) {
		let view = this.getView(name);
		
		return view.dataset.show;
	};
	
	this.hide = function hide(name) {
		if(DEBUG) {
			console.log('Hide View: ', name);
		}

		let view = this.getView(name);

		view.dataset.show = false;
		//view.setAttribute('data-show', 'false');
	};

	this.error = function error(name, text) {
		if(DEBUG) {
			console.log('Error View: ', name);
		}

		let view	= this.getView(name);
		let error	= view.querySelector('ui-error');

		[].map.call(view.querySelectorAll('input[type="password"]'), function(element) {
			element.value = '';
		});

		error.innerHTML = text;
	};

	this.__constructor.apply(this, arguments);
}());