
AFRAME.registerComponent('fullscreen-btn', {
  schema: {
    startOpened: {default: false},
    width: {default: 400},
    height: {default: 320}
  },
  init: function () {
    var sceneEl = this.el.sceneEl;
    var messageEl = this.messageEl = document.createElement('div');
    var startOpened = this.data.startOpened;
    this.toggleFullScreen = this.toggleFullScreen.bind(this);
    this.isFullScreen = false;

    messageEl.classList.add('a-fullscreen');
    messageEl.setAttribute('aframe-injected', '');

    var closeButtonEl = this.closeButtonEl = document.createElement('button');
    closeButtonEl.innerHTML = 'X';
    closeButtonEl.classList.add('a-close-button-info');
    closeButtonEl.onclick = this.toggleFullScreen;

    this.createInfoButton(this.toggleFullScreen);

    this.addStyles();
    sceneEl.appendChild(messageEl);

    this.messageEl.style.display = startOpened ? '' : 'none';
    this.infoButton.style.display = startOpened ? 'none' : '';
    messageEl.addEventListener('click', function (evt) { evt.stopPropagation(); });

    var button = this.infoButton;
    document.addEventListener('fullscreenchange', () => 
    {
      if (document.fullscreenElement) 
      {
        this.isFullScreen = true;
        button.style.setProperty('--backNormal', 'url(http://be.unisan.cl/Viewer/assets/btn_normalscreen_off.png) 50% 50% no-repeat');
        button.style.setProperty('--backHover', 'url(http://be.unisan.cl/Viewer/assets/btn_normalscreen_on.png) 50% 50% no-repeat');
      } 
      else 
      {
        this.isFullScreen = false;
        button.style.setProperty('--backNormal', 'url(http://be.unisan.cl/Viewer/assets/btn_fullscreen_off.png) 50% 50% no-repeat');
        button.style.setProperty('--backHover', 'url(http://be.unisan.cl/Viewer/assets/btn_fullscreen_on.png) 50% 50% no-repeat');
      }
    });

  },

  update: function () 
  {
    var messageEl = this.messageEl;
    messageEl.appendChild(this.closeButtonEl);
  },

  addStyles: function () {
    var css =
      '.a-fullscreen{border-radius: 10px; position: absolute; width: ' + this.data.width + 'px;' +
      'height: ' + this.data.height + 'px; background-color: white; border: 3px solid rgba(0,0,0,0.65);' +
      'bottom: 22px; left: 22px; color: rgb(51, 51, 51); padding: 20px 15px 0 15px;' +
      'font-size: 11pt; line-height: 20pt; z-index: 9999}' +

      '.a-fullscreen a{border-bottom: 1px solid rgba(53,196,232,.15); color: #1497b8;' +
      'position: relative; text-decoration: none; transition: .05s ease;}' +

      '@media only screen and (min-width: 1200px) {' +
      '.a-fullscreen {font-size: 12pt}}' +

      '@media only screen and (max-width: 600px) {' +
      '.a-fullscreen {left: 20px; right: 20px; bottom: 60px; width: auto}}' +

      '@media only screen and (max-height: 600px) {' +
      '.a-fullscreen {left: 20px; bottom: 20px; height: 250px}}' +

      '.a-fullscreen-container {position: absolute; top: 110px; right: 70px;}' +
      '.a-fullscreen-button {background: var(--backNormal); background-size: 40px;}' +
      '.a-fullscreen-button {border: 0; bottom: 0; cursor: pointer; min-width: 90px; min-height: 90px; padding-right: 0; padding-top: 0; position: absolute; right: 0; transition: background-color .05s ease; -webkit-transition: background-color .05s ease; z-index: 3; border-radius: 8px; touch-action: manipulation;}' +
      '.a-fullscreen-button:active, .a-fullscreen-button:hover {background: var(--backHover);} ';
    var style = document.createElement('style');

    if (style.styleSheet) 
    {
      style.styleSheet.cssText = css;
    } 
    else 
    {
      style.appendChild(document.createTextNode(css));
    }

    document.getElementsByTagName('head')[0].appendChild(style);
  },

  toggleFullScreen: function () 
  {
    
    var sceneEl = this.el.sceneEl;
    var renderer = this.el.sceneEl.renderer;
    var camera = this.el.sceneEl.camera;
    const canvas = renderer.domElement;
    if (!this.isFullScreen)
    {
      sceneEl.requestFullscreen();
      this.isFullScreen = true;

    }
    else
    {
      document.exitFullscreen();
      this.isFullScreen = false;

    }
    camera.aspect = canvas.clientWidth / canvas.clientHeight;
    camera.updateProjectionMatrix();

  },

  createInfoButton: function (onClick) {
    var infoButton;
    var wrapper;
    wrapper = document.createElement('div');
    wrapper.classList.add('a-fullscreen-container');
    this.infoButton = infoButton = document.createElement('button');
    infoButton.className = 'a-fullscreen-button';
    infoButton.setAttribute('title', 'Information about this experience');
    wrapper.appendChild(infoButton);
    infoButton.addEventListener('click', function (evt) 
    {
      onClick();
      evt.stopPropagation();
    });
    this.el.sceneEl.appendChild(wrapper);
  },

  infoMessageButtonDataURI: 'url(./assets/btn_fullscreen_off.png)'

});
