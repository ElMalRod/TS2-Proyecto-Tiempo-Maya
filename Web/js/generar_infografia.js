function generarInfografia(nombre_energia, significado_energia, nombre_nahual, significado_nahual) {
    var imageUrl = 'img/infografia.jpg';
    var nahualImageUrl = 'img/nahual/' + nombre_nahual + '.png';
    var energiaImgeUrl = 'img/energianum/' + nombre_energia + '.png';

    var canvas = document.getElementById('canvas');
    var ctx = canvas.getContext('2d');

    var canvasWidth = 600;
    var canvasHeight = 400;
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;

    var img = new Image();
    img.src = imageUrl;

    img.onload = function () {
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height);

        ctx.fillStyle = 'rgba(0, 0, 0, 0.7)';
        ctx.fillRect(0, 0, canvas.width, canvas.height);

        ctx.font = 'bold 30px Arial';
        ctx.fillStyle = '#FFFFFF';
        ctx.textAlign = 'center';
        ctx.fillStyle = "#FFD800";
        ctx.fillText('Energía', canvas.width * 0.25, 50);

        var energiaImg = new Image();
        energiaImg.src = energiaImgeUrl;
        energiaImg.onload = function () {
            var energiaWidth = 100;
            var energiaHeight = 100;
            ctx.drawImage(energiaImg, canvas.width * 0.25 - energiaWidth / 2, 70, energiaWidth, energiaHeight);
            ctx.font = 'bold 20px Arial';
            ctx.fillStyle = "#FFD800";
            ctx.fillText('Nombre en Maya', canvas.width * 0.25, 200);
            ctx.font = 'bold 50px Arial';
            ctx.fillStyle = "#04ca89";
            ctx.fillText(nombre_energia, canvas.width * 0.25, 255);
            ctx.font = 'bold 20px Arial';
            ctx.fillStyle = "#FFD800";
            ctx.fillText('Significado', canvas.width * 0.25, 290);
            ctx.fillStyle = "#04ca89";
            var startX = canvas.width * 0.25;
            var startY = 320;
            var lineHeight = 20;
            var words = significado_energia.split(' ');
            var line = '';
            for (var i = 0; i < words.length; i++) {
                var testLine = line + words[i] + ' ';
                var metrics = ctx.measureText(testLine);
                var testWidth = metrics.width;
                if (testWidth > 250 && i > 0) {
                    ctx.fillText(line, startX, startY);
                    line = words[i] + ' ';
                    startY += lineHeight;
                } else {
                    line = testLine;
                }
            }
            ctx.fillText(line, startX, startY);
        };

        ctx.font = 'bold 30px Arial';
        ctx.textAlign = 'center';
        ctx.fillText('Nahual', canvas.width * 0.75, 50);

        ctx.font = 'bold 70px Arial';
        ctx.fillStyle = "#04ca89";
        ctx.fillText(nombre_nahual, canvas.width * 0.75, 125);
        ctx.fillStyle = "#FFD800";
        ctx.font = 'bold 20px Arial';

        ctx.fillText('Significado', canvas.width * 0.75, 170);
        ctx.fillStyle = "#04ca89";

        var startX = canvas.width * 0.75;
        var startY = 200;
        var lineHeight = 20;
        var words = significado_nahual.split(' ');
        var line = '';
        for (var i = 0; i < words.length; i++) {
            var testLine = line + words[i] + ' ';
            var metrics = ctx.measureText(testLine);
            var testWidth = metrics.width;
            if (testWidth > 250 && i > 0) {
                ctx.fillText(line, startX, startY);
                line = words[i] + ' ';
                startY += lineHeight;
            } else {
                line = testLine;
            }
        }
        ctx.fillText(line, startX, startY);

        var nahualImg = new Image();
        nahualImg.src = nahualImageUrl;
        nahualImg.onload = function () {
            var nahualWidth = 160;
            var nahualHeight = 160;
            ctx.drawImage(nahualImg, canvas.width * 0.75 - nahualWidth / 2, startY + 10, nahualWidth, nahualHeight);
        };
    };
}
