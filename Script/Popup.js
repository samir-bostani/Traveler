
jQuery.fn.showModal = function (options) {
    return this.each(function () {
        var modalDiv = $('#modal');
        if (modalDiv.length == 0)
            modalDiv = $('<div id="modal" class="popupModalDiv"></div>').appendTo(document.body);

        modalDiv.css({ 'position': 'fixed' }).show();

        var x = $(window).width() / 2 - $(this).outerWidth() / 2;
        var y = $(window).height() / 2 - $(this).outerHeight() / 2
        $(this).css({ 'position': 'fixed', 'left': x, 'top': y, 'z-index': '10001' }).focus().show();
    });
};


jQuery.fn.hideModal = function (options) {
    return this.each(function () {
        $(this).hide();
        $('#modal').hide();
    });
};



