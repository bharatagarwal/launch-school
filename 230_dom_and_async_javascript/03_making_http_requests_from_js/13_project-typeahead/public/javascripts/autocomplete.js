var Autocomplete = {
  init: function() {
    this.input = document.querySelector('input');
    this.url = '/countries?matching=';

    this.listUI = null;
    this.overlay = null;

    this.visible = false;
    this.matches = [];

    this.wrapInput();
    this.createUI();

    this.bindEvents();
    
    this.reset();
  },

  wrapInput: function() {
    var wrapper = document.createElement('div');
    wrapper.classList.add('autocomplete-wrapper');
    this.input.parentNode.appendChild(wrapper);
    wrapper.appendChild(this.input); // this will move the node to become a child of the wrapper.
  },

  createUI: function() {
    var listUI = document.createElement('ul');
    listUI.classList.add('autocomplete-ui');
    this.input.parentNode.appendChild(listUI);
    this.listUI = listUI;

    var overlay = document.createElement('div');
    overlay.classList.add('autocomplete-overlay');
    overlay.style.width = this.input.clientWidth + 'px';

    this.input.parentNode.appendChild(overlay);
    this.overlay = overlay;
  },

  bindEvents: function() {
    this.input.addEventListener('input', this.valueChanged.bind(this));
  },

  valueChanged: function() {
    var value = this.input.value;

    if (value.length > 0) {
      this.fetchMatches(value, function(matches) { // to be implemented later
        this.visible = true;
        this.matches = matches;
        this.bestMatchIndex = 0;
        this.draw();
      }.bind(this));
    } else {
      this.reset();
    }
  },

  fetchMatches: function(query, callback) { 
    var request = new XMLHttpRequest();

    request.addEventListener('load', function(event) {
      callback(request.response);
    });

    request.open('GET', this.url + encodeURIComponent(query));
    request.responseType = 'json';
    request.send();
  },

  draw: function() {
    while (this.listUI.lastChild) {
      this.listUI.removeChild(this.listUI.lastChild);
    }

    if (!this.visible) {
      this.overlay.textContent = '';
      return;
    }

    if (this.bestMatchIndex !== null && this.matches.length !== 0) {
      var selected = this.matches[this.bestMatchIndex];
      this.overlay.textContent = this.generateOverlayContent(this.input.value, selected.name);
    } else {
      this.overlay.textContent = '';
    }

    this.matches.forEach(function(match) {
      var li = document.createElement('li');
      li.classList.add('autocomplete-ui-choice');

      li.textContent = match.name;
      this.listUI.appendChild(li);
    }.bind(this));
  },

  generateOverlayContent: function(value, match) {
    var end = match.substr(value.length);
    return value + end;
  },

  reset: function() {
    this.visible = false;
    this.matches = [];
    this.bestMatchIndex = null;

    this.draw();
  },
}

document.addEventListener('DOMContentLoaded', function(event) {
  Autocomplete.init();
});
