imagenes = new Array();
//Agrega tantas imágenes como necesites en el array
imagenes[0] = "https://lh4.googleusercontent.com/-dN3EpFCaSLM/UHmHDm-BPyI/AAAAAAAACg0/Sg6_mUHUdKo/w719-h539-no/3.jpg";
imagenes[1] = "https://lh4.googleusercontent.com/-uGLzLpo9M2I/UHi8QUuTaKI/AAAAAAAACXc/RDXnT81tRHc/w719-h539-no/3.jpg";
imagenes[2] = "https://lh4.googleusercontent.com/-fiZRV54IhMg/UHsNjXjq1eI/AAAAAAAAC8g/d3vENTsqfRA/w809-h539-no/1.jpg";
imagenes[3] = "https://lh4.googleusercontent.com/-31VDTWL4ZHc/UHhLG4xDA9I/AAAAAAAACIs/v48eQW0L8t0/w719-h539-no/1.jpg";
imagenes[4] = "https://lh3.googleusercontent.com/-eL4wCSVNN2k/UHrjyxbgqKI/AAAAAAAAC1A/kLiHuBDhu54/w807-h539-no/1.jpg";
imagenes[5] = "https://lh6.googleusercontent.com/-ey5kQS1mkXk/UGmw2GoAC3I/AAAAAAAABM4/KZijAmmhoKk/w718-h539-no/1.jpg";
siguiente = 0;

function CambiaImagen() {
    dimensiones = $("#box-imagen").width();
    $("#box-imagen img").css({ left: -dimensiones + "px" }).attr("src", imagenes[siguiente]);
    $("#box-imagen img").animate({ left: "+=" + dimensiones });
    $("#box-imagen a").attr("href", imagenes[siguiente]);

    siguiente = siguiente + 1;
    if (siguiente >= imagenes.length) {
        siguiente = 0;
    }
    //Aquí puedes colocar el tiempo para cada transición de imagen
    transicion = 4000;
    setTimeout("CambiaImagen()", transicion);
}

$(function () {
    CambiaImagen();
});