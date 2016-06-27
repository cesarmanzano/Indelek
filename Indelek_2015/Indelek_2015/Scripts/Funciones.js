///// <reference path="jquery-2.0.3.js" />

$(document).ready(function () {
    //Cuando me Posiciono sobre el ID #Lista_Productos
    //Agrega la Clase para hacer Visible el Menú.
    $("#Lista_Productos").mouseover(function (event) {
        $("#Contenedor_Menu_Dinamico").addClass("Contenedor_Menu_Dinamico_Visible");
    });

    $("#Lista_Productos").mouseout(function (event) {
        $("#Contenedor_Menu_Dinamico").removeClass("Contenedor_Menu_Dinamico_Visible_Grande");
        $("#Contenedor_Menu_Dinamico").removeClass("Contenedor_Menu_Dinamico_Visible");
        $("#Contenedor_Menu_Dinamico").addClass("Contenedor_Menu_Dinamico_Oculto");
    });

    //Cuando me Posiciono sobre un objecto de la Lista 
    //Agranda el Menú para elegir las opciones de Sub Líneas y Familias.
    $("#Menu_Dinamico ul li").click(function (event) {
        $("#Contenedor_Menu_Dinamico").addClass("Contenedor_Menu_Dinamico_Visible_Grande");
    });

    //Cuando me Posiciono sobre el Menú de Líneas
    //Agrego nuevamente la clase "Contenedor_Menu_Dinamico_Visible_Grande" porque al entrar
    //al menú se sale del contenedor y se ejecuta la acción de la parte de abajo.
    $("#Menu_Dinamico").mouseover(function (event) {
        $("#Contenedor_Menu_Dinamico").addClass("Contenedor_Menu_Dinamico_Visible_Grande");
    });

    //Cuando el cursor se sale de los elementos de Línea, Sub Línea y Familia se escucha la posición
    //del cursor sobre el Contenedo del Menú para ocultarlo al Salirse del Contenedor.
    $("#Menu_Dinamico ul li").mouseout(function (event) {
        $("#Contenedor_Menu_Dinamico").mouseout(function (event) {
            $("#Contenedor_Menu_Dinamico").removeClass("Contenedor_Menu_Dinamico_Visible_Grande");
            $("#Contenedor_Menu_Dinamico").removeClass("Contenedor_Menu_Dinamico_Visible");
            $("#Contenedor_Menu_Dinamico").addClass("Contenedor_Menu_Dinamico_Oculto");
        });
    });

    $("#cmdArticulo_Agregado").click(function () {
        $("#Articulo_Agregado").slideUp(500);
    });

    $("#link_Cerrar_Sesion").click(function () {
        window.location = "Cerrar_Sesion.aspx";
    });

    $("#Imagen_Super_Oferta").on("click", function () {
        var lcURL = $("#Imagen_Super_Oferta").attr("alt");

        window.location(lcURL);
    });

   // setInterval('avanzaSlide()', 5000);


});


function Activar_Sesion(lcEstado) {
    if (lcEstado != "DesActivar") {
        $("#link_Iniciar_Sesion").css("display", "none");
        $("#link_Cerrar_Sesion").css("color", "Yellow");
        $("#link_Cerrar_Sesion").css("display", "block");
        $("#link_Cerrar_Sesion").text(lcEstado);
    }
    else {
        $("#link_Cerrar_Sesion").css("display", "none");
        $("#link_Iniciar_Sesion").css("display", "block");
    }
}

function Cambia_Valor_Control(lcControl, lcValor, cPropiedad) {
    if (cPropiedad == "texto")
        $(lcControl).text(lcValor);
    else if (cPropiedad == "html")
        $(lcControl).html(lcValor);
    else
        $(lcControl).val(lcValor);
}

function Informacion_Articulo(lcArticulo, lcDescripcion) {

    window.open("Informacion_Articulo.aspx?lcArticulo=" + lcArticulo, "ventana", "fullscreen=1");
    focus();

    //    window.showModalDialog(
    //        'Informacion_Articulo.aspx?lcArticulo=' + lcArticulo,
    //        'Titulo de la Ventana',
    //        'dialogHeight:500px px;dialogWidth:850px;unadorned:yes;help:No;resizable: No;status:No;');
}

function Muestra_Mensaje(lcMensaje) {
    $("#Articulo_Agregado").css("background-color", "DarkGray");
    $("#Articulo_Agregado").css("height", "50px");
    $("#cmdArticulo_Agregado").css("height", "50px");
    $("#txtMensaje").text(lcMensaje);
    $("#Articulo_Agregado").slideDown(1000);

    setTimeout(function () {
        $("#Articulo_Agregado").slideUp(500);
        $("#cmdArticulo_Agregado").css("height", "1px");
    }, 5000);

}

function Muestra_Mensaje_Error(lcMensaje) {
    $("#Articulo_Agregado").css("background-color", "rgb(219,156,154)");
    $("#Articulo_Agregado").css("height", 100);
    $("#cmdArticulo_Agregado").css("height", 100);
    $("#txtMensaje").text(lcMensaje);
    $("#Articulo_Agregado").slideDown(1000);
}

function Valida_Enter(loBoton) {
    var key = window.event.keyCode;

    if (key == 13)
        document.getElementById(loBoton).click();
}





