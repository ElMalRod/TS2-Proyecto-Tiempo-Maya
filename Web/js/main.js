jQuery(document).ready(async function ($) {
  // Header fixed and Back to top button
  if ($("body").width() < 994) {
    $(".back-to-top").fadeIn("slow");
    $("#header").addClass("header-fixed");
  }

  $("body").scroll(function () {
    if ($(this).scrollTop() > 100 || $("body").width() < 994) {
      $(".back-to-top").fadeIn("slow");
      $("#header").addClass("header-fixed");
    } else {
      $(".back-to-top").fadeOut("slow");
      $("#header").removeClass("header-fixed");
    }
  });
  $(".back-to-top").click(function () {
    $("html, body").animate(
      {
        scrollTop: 0,
      },
      1500,
      "easeInOutExpo"
    );
    return false;
  });

  document
    .getElementById("calculadora-picker")
    ?.addEventListener("change", async (event) => {
      const res = await fetch(`/calculadora.php?fecha=${event.target.value}`);
      const html = await res.text();
      document.getElementById("calculadora-res").innerHTML = html;
    });

  document
    .getElementById("cuenta-larga-picker")
    ?.addEventListener("change", async (event) => {
      const res = await fetch(
        `/models/cuenta-larga.php?fecha=${event.target.value}`
      );
      const html = await res.text();
      const parser = new DOMParser();
      const htmlParsed = parser.parseFromString(html, "text/html");
      document.getElementById("change-cuenta-larga").innerHTML =
        htmlParsed.getElementById("change-cuenta-larga").innerHTML;
    });

  document
    .getElementById("cruz-picker")
    ?.addEventListener("change", async (event) => {
      const res = await fetch(
        `/models/cruz-maya.php?fecha=${event.target.value}`
      );
      const html = await res.text();
      const parser = new DOMParser();
      const htmlParsed = parser.parseFromString(html, "text/html");
      document.getElementById("change-cruz").innerHTML =
        htmlParsed.getElementById("change-cruz").innerHTML;
    });

  const ruedaPicker = document.getElementById("rueda-calendarica-picker");

  if (ruedaPicker) {
    const circleEnergia = document.getElementById("circle-energia");
    const circleNahual = document.getElementById("circle-nahual");
    const circleHaab = document.getElementById("haab");

    const getRuedaCalendarica = async (ev) => {
      const date = ruedaPicker.value;
      const res = await fetch(
        `/backend/buscar/conseguir_rueda_calendarica.php${
          date ? `?fecha=${date}` : ""
        }`
      );
      const ruedaCalendarica = await res.json();
      const {
        cholquij: {
          energia: { numero: numeroEnergia },
          nahual: { numero: numeroNahual },
        },
        haab: {
          kin: { numero: numeroKin },
          uinal: { numero: numeroUinal },
        },
      } = ruedaCalendarica;

      const haab = (numeroUinal * 20 + numeroKin - 1) % 365;
      const energia = numeroEnergia - 1;
      const nahual = (numeroNahual - 1 + 3) % 20;

      let curr = haab;

      while (
        curr % 13 !== energia ||
        curr % 20 !== nahual ||
        curr % 365 != haab
      ) {
        curr += 365;
        if (curr >= 18980) {
          curr = 0;
          break;
        }
      }

      circleEnergia.style.transform = `rotate(${curr * 27.692308}deg)`;
      circleNahual.style.transform = `rotate(${curr * 18}deg)`;
      circleHaab.style.transform = `rotate(${curr * -0.9863}deg)`;
    };

    ruedaPicker.addEventListener("change", getRuedaCalendarica);
    await getRuedaCalendarica();
  }

  // Initiate the wowjs
  new WOW().init();

  // Initiate superfish on nav menu
  $(".nav-menu").superfish({
    animation: {
      opacity: "show",
    },
    speed: 500,
  });

  // Mobile Navigation

  // Smoth scroll on page hash links
  // $('a[href*="#"]:not([href="#"])').on("click", function () {
  //   if (
  //     location.pathname.replace(/^\//, "") ==
  //       this.pathname.replace(/^\//, "") &&
  //     location.hostname == this.hostname
  //   ) {
  //     var target = $(this.hash);
  //     if (target.length) {
  //       var top_space = 0;

  //       if ($("#header").length) {
  //         top_space = $("#header").outerHeight();

  //         if (!$("#header").hasClass("header-fixed")) {
  //           top_space = top_space - 20;
  //         }
  //       }

  //       $("html, body").animate(
  //         {
  //           scrollTop: target.offset().top - top_space,
  //         },
  //         1500,
  //         "easeInOutExpo"
  //       );

  //       if ($(this).parents(".nav-menu").length) {
  //         $(".nav-menu .menu-active").removeClass("menu-active");
  //         $(this).closest("li").addClass("menu-active");
  //       }

  //       if ($("body").hasClass("mobile-nav-active")) {
  //         $("body").removeClass("mobile-nav-active");
  //         $("#mobile-nav-toggle i").toggleClass("fa-times fa-bars");
  //         $("#mobile-body-overly").fadeOut();
  //       }
  //       return false;
  //     }
  //   }
  // });

  // Filtro del portafolio
  $("#portafolio-flters li").click(function () {
    $("#portafolio-flters li").removeClass("filter-active");
    $(this).addClass("filter-active");

    var selectedFilter = $(this).data("filter");
    $("#portafolio-wrapper").fadeTo(100, 0);

    $(".portafolio-item").fadeOut().css("transform", "scale(0)");

    setTimeout(function () {
      $(selectedFilter).fadeIn(100).css("transform", "scale(1)");
      $("#portafolio-wrapper").fadeTo(300, 1);
    }, 300);
  });

  // contar
  $('[data-toggle="counter-up"]').counterUp({
    delay: 10,
    time: 1000,
  });
});
