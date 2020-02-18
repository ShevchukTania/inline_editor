document.addEventListener('DOMContentLoaded', function(){
  document.querySelectorAll('.form select').forEach(select => {
    let inlineEditSuccess = createEvent('inlineEditSuccess');
    let inlineEditError = createEvent('inlineEditError');

    select.addEventListener("change", function(){
      let data = {};
      let target = event.currentTarget;
      const url = target.dataset.url;
      data[target.dataset.param] = target.querySelector('option:checked').text;

      fetch(url, {
        method: 'PUT',
        body: JSON.stringify(data),
        headers: { 'Content-Type': 'application/json' }
      })
      .then(response => {
        return response.json();
      })
      .then(resultJson => {
        const form = target.parentNode;
        const hint = form.querySelector( 'span.inline-form-hint' );
        if (hint) {
          hint.remove();
        };

        if (resultJson.status === 'error') {
          form.dispatchEvent(inlineEditError);

          form.classList.add('invalid-value');
          if (resultJson.message) {
            form.insertAdjacentHTML('beforeend',
              "<span class='inline-form-hint'>" + resultJson.message + "</span>"
            );
          }
        } else {
          const container = form.parentNode;
          let clicableItem = container.querySelector('.clickable-item');

          form.dispatchEvent(inlineEditSuccess);

          form.classList.remove('invalid-value');
          clicableItem.innerHTML = '';
          clicableItem.insertAdjacentHTML('beforeend', resultJson.html);
          toggleVisibility(container);
        }
      })
      .catch(function(error) {
        console.log('Request failed', error)
      });
    });
  });

  document.querySelectorAll('.clickable-item').forEach(item => {
    item.addEventListener("click", function(){
      const container = event.target.closest('.inline-editor-container');
      toggleVisibility(container);
    })

    document.querySelector('body').addEventListener('click', function(){
      const activeForm = document.querySelector('.form.active');
      const container = event.target.closest('.inline-editor-container')

      if (activeForm && !(event.target.closest('.inline-editor-container'))) {
        activeForm.classList.remove('active');
        activeForm.classList.add('display-none');
        activeForm.previousElementSibling.classList.remove('display-none');
      }
    });
  });

  function toggleVisibility(container) {
    container.querySelectorAll('.clickable-item, .form').forEach(item => {
      item.classList.toggle('display-none');
    })

    container.querySelector('.form').classList.toggle('active');
  }

  function createEvent(name) {
    var event = document.createEvent('Event');
    event.initEvent(name, true, true);
    return event
  }
});
