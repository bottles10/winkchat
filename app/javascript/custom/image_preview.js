let loadImage = function(event) {
    let output = document.querySelector('#image-preview');
    output.src = URL.createObjectURL(event.target.files[0]);
  }

  window.loadImage = loadImage;