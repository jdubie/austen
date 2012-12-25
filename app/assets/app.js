var ORIGIN = '//m.com:3005'; // TODO make this production

var tasks = [
  { element: 'link', attributes: { rel: 'stylesheet', href: 'stylesheets/app.css' } },
  { element: 'script', attributes: { src: 'bookmarklet/javascripts/vendor.js' } },
  { element: 'script', attributes: { src: 'bookmarklet/javascripts/app.js' } }
];

var numCallbacks = 0;
done = false;
var callback = function() {
  if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
    // BUG we might get here twice for one script
    numCallbacks++;
    if (numCallbacks >= tasks.length) {
      done = true;
      window.require('initialize');
    }
  }
};

for (var taskIndex in tasks) {
  task = tasks[taskIndex];
  var elem = document.createElement(task.element);
  for (attribute in task.attributes) {
    var value = task.attributes[attribute];
    if (task.element === 'script' && attribute === 'src') {
      value = ORIGIN + '/' + value;
    }
    if (task.element === 'link' && attribute === 'href') {
      value = ORIGIN + '/' + value;
    }
    elem[attribute] = value;
  }
  elem.onload = elem.onreadystatechange = callback;
  console.log(elem);
  document.head.appendChild(elem);
  //document.getElementsByTagName("head")[0].appendChild(script);
}
