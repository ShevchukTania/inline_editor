document.addEventListener('DOMContentLoaded', function(){
  document.addEventListener('inlineEditError', (e)=>{
    setFlash(e.detail.flash);
  })

  document.addEventListener('inlineEditSuccess', (e)=>{
    setFlash(e.detail.flash);
  })

  function setFlash({ type, message }) {
    if(!type || !message) return null;

    const text = `<div class=${type}>${message}</div>`;
    const flashContainer = document.querySelector('.flash-container')
    flashContainer.innerHTML = text;
    setTimeout(function(){ flashContainer.innerHTML = '' }, 1000);
  }
})
