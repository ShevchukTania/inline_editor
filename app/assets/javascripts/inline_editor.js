document.addEventListener('DOMContentLoaded', function(){
  document.querySelectorAll('.form select').forEach(select => {
    select.addEventListener("change", function(){
      let data = {};
      let target = event.currentTarget;
      const url = target.dataset.url;
      data[target.dataset.attribute] = target.querySelector('option:checked').text;

      fetch(url, {
        method: 'PUT',
        body: JSON.stringify({ inline_editor: data }),
        headers: { 'Content-Type': 'application/json' }
      })
      .then(response => {
        return response.json();
      })
      .then(resultJson => {
        target.insertAdjacentHTML('beforeend', resultJson.html);
        debugger;
      })
      .catch(function(error) {
        console.log('Request failed', error)
      });
    });
  });

  document.querySelectorAll('.clickable-item').forEach(item => {
    item.addEventListener("click", function(){
      const container = event.target.closest('.inline-editor-container');
      container.querySelectorAll('.clickable-item, .form').forEach(item => {
        item.classList.toggle('display-none');
      })

      container.querySelector('.form').classList.toggle('active');
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
});
