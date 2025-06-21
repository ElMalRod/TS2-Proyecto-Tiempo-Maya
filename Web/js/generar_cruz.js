function generarCruz(mano_izquierda, concepcion, nombre_nahual, destino, mano_derecha) {
    var canvas = document.getElementById('canvas');
    var ctx = canvas.getContext('2d');

    var canvasWidth = 400;
    var canvasHeight = 400;
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;

    function loadImages(paths, callback) {
        var imgs = [];
        var imgsLoaded = 0;
        paths.forEach(function (path, index) {
            var img = new Image();
            img.onload = function () {
                imgsLoaded++;
                if (imgsLoaded == paths.length) {
                    callback(imgs);
                }
            };
            img.src = path;
            imgs.push(img);
        });
    }

    function draw(images, texts, titles) {
        ctx.fillStyle = "#04ca89";
        ctx.font = "bold 12px Arial";
        var totalImages = images.length;
        var maxImageWidth = Math.max(...images.map(img => img.width));
        var maxImageHeight = Math.max(...images.map(img => img.height));

        var maxAllowedWidth = canvas.width / 5;
        var maxAllowedHeight = canvas.height / 5;

        var scale = Math.min(maxAllowedWidth / maxImageWidth, maxAllowedHeight / maxImageHeight);
        var scaledWidth = maxImageWidth * scale * 0.8;
        var scaledHeight = maxImageHeight * scale * 0.8;

        var verticalSpacing = 20;

        var centerImageIndex = Math.floor(totalImages / 2);
        var centerImageX = (canvas.width - scaledWidth) / 2;
        var centerImageY = (canvas.height - scaledHeight) / 2;
        ctx.drawImage(images[centerImageIndex], centerImageX, centerImageY, scaledWidth, scaledHeight);

        var textWidth = ctx.measureText(texts[centerImageIndex]).width;
        var textX = centerImageX + (scaledWidth - textWidth) / 2;
        ctx.fillText(texts[centerImageIndex], textX, centerImageY + scaledHeight + verticalSpacing);

        var title = titles[centerImageIndex];
        var titleWidth = ctx.measureText(title).width;
        var titleX = centerImageX + (scaledWidth - titleWidth) / 2;
        ctx.fillText(title, titleX, centerImageY - verticalSpacing);

        var leftImageIndex = centerImageIndex - 1;
        var rightImageIndex = centerImageIndex + 1;
        if (leftImageIndex >= 0 && rightImageIndex < totalImages) {
            var leftImageX = centerImageX - scaledWidth - 80;
            var rightImageX = centerImageX + scaledWidth + 80;
            var sideImageY = (canvas.height - scaledHeight) / 2;
            ctx.drawImage(images[leftImageIndex], leftImageX, sideImageY, scaledWidth, scaledHeight);
            ctx.fillText(texts[leftImageIndex], leftImageX + (scaledWidth - ctx.measureText(texts[leftImageIndex]).width) / 2, sideImageY + scaledHeight + verticalSpacing);
            ctx.fillText(titles[leftImageIndex], leftImageX + (scaledWidth - ctx.measureText(titles[leftImageIndex]).width) / 2, sideImageY - verticalSpacing); // Colocar el título encima de la imagen
            ctx.drawImage(images[rightImageIndex], rightImageX, sideImageY, scaledWidth, scaledHeight);
            ctx.fillText(texts[rightImageIndex], rightImageX + (scaledWidth - ctx.measureText(texts[rightImageIndex]).width) / 2, sideImageY + scaledHeight + verticalSpacing);
            ctx.fillText(titles[rightImageIndex], rightImageX + (scaledWidth - ctx.measureText(titles[rightImageIndex]).width) / 2, sideImageY - verticalSpacing); // Colocar el título encima de la imagen
        }

        var topImageIndex = centerImageIndex - 2;
        var bottomImageIndex = centerImageIndex + 2;
        if (topImageIndex >= 0 && bottomImageIndex < totalImages) {
            var topImageY = centerImageY - scaledHeight - 50 - verticalSpacing;
            var bottomImageY = centerImageY + scaledHeight + 58 + verticalSpacing;
            var middleImageX = (canvas.width - scaledWidth) / 2;
            ctx.drawImage(images[topImageIndex], middleImageX, topImageY, scaledWidth, scaledHeight);
            ctx.fillText(texts[topImageIndex], middleImageX + (scaledWidth - ctx.measureText(texts[topImageIndex]).width) / 2, topImageY + scaledHeight + verticalSpacing);
            ctx.fillText(titles[topImageIndex], middleImageX + (scaledWidth - ctx.measureText(titles[topImageIndex]).width) / 2, topImageY - verticalSpacing); // Colocar el título encima de la imagen
            ctx.drawImage(images[bottomImageIndex], middleImageX, bottomImageY, scaledWidth, scaledHeight);
            ctx.fillText(texts[bottomImageIndex], middleImageX + (scaledWidth - ctx.measureText(texts[bottomImageIndex]).width) / 2, bottomImageY + scaledHeight + verticalSpacing);
            ctx.fillText(titles[bottomImageIndex], middleImageX + (scaledWidth - ctx.measureText(titles[bottomImageIndex]).width) / 2, bottomImageY - verticalSpacing); // Colocar el título encima de la imagen
        }
    }

    function drawCross() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.fillStyle = "#2e2e2e";
        ctx.strokeStyle = "#04ca89";

        var crossWidth = 150;
        var crossHeight = 400;
        var crossX = (canvas.width - crossWidth) / 2;
        var crossY = (canvas.height - crossHeight) / 2;

        ctx.fillRect(crossX, crossY, crossWidth, crossHeight);
        ctx.fillRect(crossX - crossHeight / 2 + crossWidth / 2, crossY + crossHeight / 2 - crossWidth / 2, crossHeight, crossWidth);

        ctx.strokeRect(crossX, crossY, crossWidth, crossHeight);
        ctx.strokeRect(crossX - crossHeight / 2 + crossWidth / 2, crossY + crossHeight / 2 - crossWidth / 2, crossHeight, crossWidth);
    }

    var titles = [
        'Concepcion',
        'Mano izquierda',
        'Nacimiento',
        'Mano derecha',
        'Destino'
    ];

    var imagePaths = [
        'img/nahual/' + concepcion + '.png',
        'img/nahual/' + mano_izquierda + '.png',
        'img/nahual/' + nombre_nahual + '.png',
        'img/nahual/' + mano_derecha + '.png',
        'img/nahual/' + destino + '.png'
    ];

    var texts = [
        concepcion,
        mano_izquierda,
        nombre_nahual,
        mano_derecha,
        destino
    ];

    loadImages(imagePaths, function (images) {
        drawCross();
        draw(images, texts, titles);

    });
}