AFRAME.registerComponent("threecomp", {
    init: function() {
      var targetCube = new THREE.WebGLRenderTargetCube(1024, 1024);
      var renderer = this.el.sceneEl.renderer;
      var camera = this.el.sceneEl.camera;

      this.el.addEventListener("model-loaded", e => {
        let mesh = this.el.getObject3D("mesh");
        let object = this.el.object3D;
        var texture = new THREE.TextureLoader().load(
          "https://unisan.cl/bundles/inamikafrontend/viewer/wide_street_01.jpg",
          function() 
          {
            var cubeTex = targetCube.fromEquirectangularTexture(renderer, texture);
            mesh.traverse(function(el) 
            {
              if (el.material) 
              {
                el.material.envMap = cubeTex.texture;
                el.material.envMap.intensity = 1;
                el.material.needsUpdate = true;
              }
            });
            renderer.toneMapping = THREE.ACESFilmicToneMapping;
            renderer.outputEncoding = THREE.sRGBEncoding;
            const canvas = renderer.domElement;
            camera.aspect = canvas.clientWidth / canvas.clientHeight;
            camera.updateProjectionMatrix();
            let splash = document.getElementById("splash");
            splash.style.zIndex = 0;
            object.visible = true;
          }

        );
      });
    }
  });