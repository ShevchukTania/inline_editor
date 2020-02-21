document.addEventListener('DOMContentLoaded', function(){
  document.querySelectorAll('.form select').forEach(select => {
    select.addEventListener("change", function(e){
      let data = {};
      let target = e.currentTarget;
      const url = target.dataset.url;
      let url_type = url.split('.').pop();
      data[target.dataset.param] = target.querySelector('option:checked').text;

      fetch(url, {
        method: 'PUT',
        body: JSON.stringify({post: data}),
        headers: { 'Content-Type': 'application/json' }
      })
      .then(response => {
        return url_type == 'js' ? response.text() : response.json();
      })
      .then(result => {
        if(url_type == 'js') {
          eval(result);
        }
        else {
          const form = target.parentNode;
          const hint = form.querySelector('span.inline-form-hint');
          if (hint) {
            hint.remove();
          };

          if (result.status === 'error') {
            form.dispatchEvent(createEvent('inlineEditError', result));

            form.classList.add('invalid-value');
            if (result.message) {
              form.insertAdjacentHTML('beforeend',
                "<span class='inline-form-hint'>" + result.message + "</span>"
              );
            }
          }
          else {
            const container = form.parentNode;
            let clicableItem = container.querySelector('.clickable-item');

            form.dispatchEvent(createEvent('inlineEditSuccess', result))

            form.classList.remove('invalid-value');
            clicableItem.innerHTML = '';
            clicableItem.insertAdjacentHTML('beforeend', result.html);
            toggleVisibility(container);
          }
        }
      })
      .catch(function(error) {
        console.log('Request failed', error)
      });
    });
  });

  document.querySelectorAll('.clickable-item').forEach(item => {
    item.addEventListener("click", function(e){
      const container = e.target.closest('.inline-editor-container');
      toggleVisibility(container);
    })

    document.querySelector('body').addEventListener('click', function(e){
      const activeForm = document.querySelector('.form.active');
      const container = e.target.closest('.inline-editor-container')

      if (activeForm && !(e.target.closest('.inline-editor-container'))) {
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

  function createEvent(name, params) {
    return event = new CustomEvent(name, {
      detail: params,
      bubbles: true,
      cancelable: true
    });
  }
});
