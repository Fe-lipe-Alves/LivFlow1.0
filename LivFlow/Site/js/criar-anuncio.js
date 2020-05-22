$(document).ready(function () {
    $.ajax({
        url: 'repostorioAjax.aspx',
        type: 'get',
        data: 'oal',
        success: function (response) {
            alert(response);
        }
    })
});