$(document).ready(() => {
  $(document).on('change', '.auto-update-attribute select', function() {
    $this = $(this);
    var info = {};
    var data = {};
    data[$this.data('attribute')] = $this.find('option:selected').text();
    modelName = $this.closest('.inline-editor-container').data('model');
    info[modelName] = data;

    $.ajax({
      type: "PATCH",
      url: $this.parents('.auto-update-attribute').data('url'),
      dataType: "script",
      data: info
    });
  });

  $(document).on('click', '.clickable-item', function() {
    $this = $(this);
    var container = $this.closest('.inline-editor-container');
    container.find('.clickable-item, .auto-update-attribute').toggleClass('d-none');
    container.find('.auto-update-attribute').toggleClass('active');

    $('body').on('click', function(event) {
      if (!$(event.target).closest('.auto-update-attribute.active').length) {
        $('.auto-update-attribute.active').removeClass('active').addClass('d-none')
        .siblings('.clickable-item').removeClass('d-none');
      };
    });
  });
});