// WARNING: DO NOT set the <base href> like this in production!
    // Details: https://webdev.dartlang.org/angular/guide/router

    void function () {
        var m = document.location.pathname.match(/^(\/[-\w]+)+\/web($|\/)/);
        document.write('<base href="' + (m ? m[0] : '/') + '" />');
      }