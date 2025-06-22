// Función que detecta rutas de imagen inválidas
function esRutaInvalida(src) {
  return !src ||
         src.endsWith('/.png') ||
         src.endsWith('undefined.png') ||
         src.includes('undefined');
}

function createCalendar(calendar, year, month) {
  const tbl = calendar.querySelector('tbody');
  tbl.innerHTML = '';                    // Limpia contenido previo
  year  = parseInt(year, 10);
  month = parseInt(month, 10) - 1;       // los <select> vienen 1–12, JS usa 0–11

  // ¿En qué día de la semana cae el 1?
  let firstDay = new Date(year, month, 1).getDay();
  let row = tbl.insertRow();

  // Celdas vacías hasta el primer día
  for (let i = 0; i < firstDay; i++) {
    row.insertCell();
  }

  // Número de días en ese mes
  const daysInMonth = new Date(year, month + 1, 0).getDate();

  for (let day = 1; day <= daysInMonth; day++) {
    if (firstDay === 7) {
      firstDay = 0;
      row = tbl.insertRow();
    }

    const elemento = diasMes[day] || {};
    const [cholqNombre, cholqNum] = (elemento.cholquij || '').split(' ');
    const [haabNombre, haabNum] = (elemento.haab    || '').split(' ');

    // Rutas a las cuatro imágenes
    const src1 = `img/numerosCalendario/${cholqNum}.png`;
    const src2 = `img/nahuales_alterno/${cholqNombre.toLowerCase().replace(/[^a-z]/g,'')}.png`;
    const src3 = `img/numerosCalendario/${haabNum}.png`;
    const src4 = `img/uinales_alterno/${haabNombre.toLowerCase().replace(/[^a-z]/g,'')}.png`;

    // Si alguna ruta es inválida, NO mostramos la celda (la dejamos en blanco)
    if ([src1, src2, src3, src4].some(esRutaInvalida)) {
      row.insertCell();
      firstDay++;
      continue;
    }

    // Construimos la celda con contenido
    const cell = row.insertCell();
    cell.innerHTML = `
      <div class="calendar-day">
        <div class="text-up">${day}</div>
        <div class="images-container">
          <img class="maya_num" src="${src1}" alt="${cholqNum}">
          <img class="maya_cal" src="${src2}" alt="${cholqNombre}">
          <img class="maya_num" src="${src3}" alt="${haabNum}">
          <img class="maya_cal" src="${src4}" alt="${haabNombre}">
        </div>
        <div class="text-below">
          ${elemento.cholquij || ''} - ${elemento.haab || ''}
        </div>
      </div>`;
    firstDay++;
  }

  // Rellenar la última fila hasta sábado si falta
  if (firstDay !== 7) {
    for (let i = firstDay; i < 7; i++) {
      row.insertCell();
    }
  }
}

// Al cargar la página y al cambiar mes/año
function initCalendar() {
  const form    = document.querySelector('.selector-fecha form');
  const yearSel = form.querySelector('select[name="anio"]');
  const monthSel= form.querySelector('select[name="mes"]');
  const calendarEl = document.querySelector('.calendar');

  // Función para (re)dibujar
  function redraw() {
    createCalendar(calendarEl, yearSel.value, monthSel.value);
  }

  // Dibujar inicialmente
  redraw();

  // Cuando cambie mes o año, volvemos a dibujar
  form.addEventListener('change', function(e) {
    e.preventDefault();
    redraw();
  });
}

document.addEventListener('DOMContentLoaded', initCalendar);
