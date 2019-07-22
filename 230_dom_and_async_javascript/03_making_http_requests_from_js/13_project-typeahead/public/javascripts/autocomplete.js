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
    console.log(this.matches);
  },

  reset: function() {
    console.log('please reset')
  },
}

document.addEventListener('DOMContentLoaded', function(event) {
  Autocomplete.init();
});
