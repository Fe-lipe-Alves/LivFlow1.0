$(document).ready(function () {

    // Veriifica se email está no formato correto
    function VerificaEmail() {
        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

        if (filter.test($('#txtEmail').val())) {
            $('#emailFeedback').removeClass('invalid-feedback').html("").hide();
            return true;
        } else {
            $('#emailFeedback').addClass('invalid-feedback').html("E-mail incorreto.").show();
            return false;
        }
    }

    // Verifica se os campos etão preenchidos
    // se algum campo estiver vazio faz alertas e impede o envio
    // Se nenhum campo estiver vazio permite o envio 
    $('#btnEntrar').on('click', function (e) {

        var email = $('#txtEmail');
        var senha = $('#txtSenha');

        if (email.val() == "") {
            email.addClass('erro');
            $('#emailFeedback').addClass('invalid-feedback').html("Preencha o campo de e-mail.").show();
        } else {
            email.removeClass('erro');
            $('#emailFeedback').hide().html("");
        }

        if (senha.val() == "") {
            senha.addClass('erro');
            $('#senhaFeedback').addClass('invalid-feedback').html("Preencha o campo de senha.").show();
        } else {
            senha.removeClass('erro');
            $('#senhaFeedback').hide().html("");
        }

        if (email.val() == "" || senha.val() == "" || !VerificaEmail($('#txtEmail')) ) {
            e.preventDefault();
            return false;
        }
    });

    // Remove erro de campo vazio quando uma tecla for digitada no campo
    $('#txtEmail, #txtSenha').on('keydown', function () {
        if ($(this).hasClass('erro')) {
            $(this).removeClass('erro');
            $(this).parents('.form-group').find('.feedback').removeClass('invalid-feedback').html("").hide();
        }
    });

    // Verifica se e-mail está correto
    $('#txtEmail').on('blur', function () {
        VerificaEmail();
    });
});