$(document).ready(function () {
    $('#btnEditarPerfil').on('click', function () {
        $('#edicao').removeClass('d-none');
        $('#exibicao').addClass('d-none');
    });

    $('#novaImagem').on('click', function () {
        $('#fileNovaImagem').click();
    });
});