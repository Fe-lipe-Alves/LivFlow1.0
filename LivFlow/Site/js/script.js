function feedback() {
    $('#feedback').slideDown('slow');
    setTimeout(function () {
        $('#feedback').slideUp('slow');
    }, 5000);
}

$(document).ready(function ()
{
    $('#feedback .errorHeader').on('click', function () {
        var content = $(this).parents('.row').find('.errorContent');
        if (content.hasClass('d-none')) {
            content.removeClass('d-none')
        } else {
            content.addClass('d-none')
        }
    });

    $('#btnInfoSeguir').on('click', function () {
        var erro = false;
        $('.obrigatorio').each(function () {
            if ($(this).val() == "") {
                $(this).parent().find('.invalid-feedback').show();
                erro = true;
            } else {
                $(this).parent().find('.invalid-feedback').hide();
            }
        });

        if (erro) {
            return false;
        }
    });

    $('a.desabled').on('click', function (e) {
        e.preventDefault();
    });

    $('.itemListaLivro').on('click', function () {
        $('.itemListaLivro').each(function () {
            $(this).removeClass('itemListaLivroAtivo');
        });


        $(this).addClass('itemListaLivroAtivo');
        $('#txtIdLivro').val($(this).data('idlivro'));
        $('#infoNaoSelecionado').html('Livro selecionado: '+$(this).find('span.titulo').text());
    });

    $('.imagensDemo').on('click', function () {
        $('hiddenImagemCapa').val($(this).data('idimagem')));
    });
});