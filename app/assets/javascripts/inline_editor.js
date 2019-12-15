document.addEventListener('DOMContentLoaded', function(){
  document.querySelectorAll('.form select').forEach(select => {
    select,addEventListener("change", function(){
      debugger;
      var info = {};
      var data = {};
      data[event.target.data('attribute')] = event.target.querySelector('option:selected').text();
      modelName = event.target.querySelectorAll.closest('.inline-editor-container').data('model');
      info[modelName] = data;
    })
  }),

  //   $this = $(this);

  //
  //   $.ajax({
  //     type: "PATCH",
  //     url: $this.parents('.auto-update-attribute').data('url'),
  //     dataType: "script",
  //     data: info
  //   });
  // });


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
        console.log('ddd');
        activeForm.classList.remove('active');
        activeForm.classList.add('display-none');
        activeForm.previousElementSibling.classList.remove('display-none');
      }
    });
  });
});