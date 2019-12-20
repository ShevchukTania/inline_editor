document.addEventListener('DOMContentLoaded', function(){
  document.querySelectorAll('.form select').forEach(select => {
    select.addEventListener("change", function(){
      var info = {};
      var data = {};
      var url = event.target.dataset.url;
      data[event.target.dataset.attribute] = event.target.querySelector('option:checked').text;
      modelName = event.target.closest('.inline-editor-container').dataset.model;
      info[modelName] = data;

      fetch(url, {
        method: 'PUT',
        body: JSON.stringify(info),
        headers: { 'Content-Type': 'application/json'
        },
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
