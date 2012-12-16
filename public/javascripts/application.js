window.cssdoc = {
  adjustIframeHeight: function() {
    var iframe = $(window.parent.document).find('iframe');
    iframe.attr('height', $(document.body).height());
  }
};
