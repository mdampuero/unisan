
AFRAME.registerComponent('info-message', {
  schema: {
    htmlSrc: {type: 'selector'},
    startOpened: {default: false},
    width: {default: 400},
    height: {default: 320}
  },
  init: function () {
    var sceneEl = this.el.sceneEl;
    var messageEl = this.messageEl = document.createElement('div');
    var startOpened = this.data.startOpened;
    this.toggleInfoMessage = this.toggleInfoMessage.bind(this);

    messageEl.classList.add('a-info-message');
    messageEl.setAttribute('aframe-injected', '');

    var closeButtonEl = this.closeButtonEl = document.createElement('button');
    closeButtonEl.innerHTML = 'X';
    closeButtonEl.classList.add('a-close-button-info');
    closeButtonEl.onclick = this.toggleInfoMessage;

    this.createInfoButton(this.toggleInfoMessage);

    this.addStyles();
    sceneEl.appendChild(messageEl);

    this.messageEl.style.display = startOpened ? '' : 'none';
    this.infoButton.style.display = startOpened ? 'none' : '';
    messageEl.addEventListener('click', function (evt) { evt.stopPropagation(); });
  },

  update: function () {
    var messageEl = this.messageEl;
    messageEl.innerHTML = this.data.htmlSrc.data;
    messageEl.appendChild(this.closeButtonEl);
  },

  addStyles: function () {
    var css =
      '.a-info-message{border-radius: 10px; position: absolute; width: ' + this.data.width + 'px;' +
      'height: ' + this.data.height + 'px; background-color: white; border: 3px solid rgba(0,0,0,0.65);' +
      'bottom: 22px; left: 22px; color: rgb(51, 51, 51); padding: 20px 15px 0 15px;' +
      'font-size: 11pt; line-height: 20pt; z-index: 9999}' +

      '.a-info-message a{border-bottom: 1px solid rgba(53,196,232,.15); color: #1497b8;' +
      'position: relative; text-decoration: none; transition: .05s ease;}' +

      '@media only screen and (min-width: 1200px) {' +
      '.a-info-message {font-size: 12pt}}' +

      '@media only screen and (max-width: 600px) {' +
      '.a-info-message {left: 20px; right: 20px; bottom: 60px; width: auto}}' +

      '@media only screen and (max-height: 600px) {' +
      '.a-info-message {left: 20px; bottom: 20px; height: 250px}}' +

      '.a-close-button-info{width: 25px; height: 25px; padding: 0;' +
      'top: 10px; right: 10px; position: absolute; color: white;' +
      'font-size: 12px; line-height: 12px; border: none; background-color: #ef2d5e;' +
      'border-radius: 5px; font-weight: medium}' +

      '.a-close-button-info:hover{background-color: #b32146; color: white}' +
      '.a-info-message-container {position: absolute; left: 120px; bottom: 30px;}' +
      '.a-info-message-button {background: ' + this.infoMessageButtonDataURI + ' 50% 50% no-repeat;}' +
      '.a-info-message-button {background-size: 92% 90%; border: 0; bottom: 0; cursor: pointer; min-width: 90px; min-height: 90px; padding-right: 0; padding-top: 0; position: absolute; right: 0; transition: background-color .05s ease; -webkit-transition: background-color .05s ease; z-index: 9999; border-radius: 8px; touch-action: manipulation;}' +
      '.a-info-message-button:active, .a-info-message-button:hover {background-color: #ef2d5e;}';
    var style = document.createElement('style');

    if (style.styleSheet) {
      style.styleSheet.cssText = css;
    } else {
      style.appendChild(document.createTextNode(css));
    }

    document.getElementsByTagName('head')[0].appendChild(style);
  },

  toggleInfoMessage: function () {
    var display = this.messageEl.style.display;
    this.infoButton.style.display = display;
    display = display === 'none' ? '' : 'none';
    this.messageEl.style.display = display;
    if (display === 'none') 
    {
      this.el.emit('infomessageclosed');
    } 
    else 
    {
      this.el.emit('infomessageopened');
    }
  },

  createInfoButton: function (onClick) {
    var infoButton;
    var wrapper;
    wrapper = document.createElement('div');
    wrapper.classList.add('a-info-message-container');
    this.infoButton = infoButton = document.createElement('button');
    infoButton.className = 'a-info-message-button';
    infoButton.setAttribute('title', 'Information about this experience');
    wrapper.appendChild(infoButton);
    infoButton.addEventListener('click', function (evt) 
    {
      onClick();
      evt.stopPropagation();
    });
    this.el.sceneEl.appendChild(wrapper);
  },

  infoMessageButtonDataURI: 'url(http://be.unisan.cl/bundles/inamikafrontend/viewer/ICON_B.png)'

});
