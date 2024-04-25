let loadAvatar = function(event) {
    let output = document.querySelector('#avatar-preview');
    let avatarPlaceholderDiv = document.querySelector('#avatar-placeholder-div')
    avatarPlaceholderDiv.classList.remove('hidden')
    output.src = URL.createObjectURL(event.target.files[0]);
  }

  window.loadAvatar = loadAvatar;