window.onload=function () {
    var avatar=document.getElementById('img-avatar-www');
    avatar.onload =onLoadFunction('img/profile.png');
};
function onLoadFunction(src) {
    if(localStorage.getItem("img-avatar-www") === null){
        var img = new Image();
        img.onload=function () {
            imgData = getBase64Image(img);
            localStorage.setItem("img-avatar-www",imgData);

        };
        img.src = src;
    }
    document.getElementById('img-avatar-www').innerHTML="<img src='data:image/png;base64,"+localStorage.getItem('img-avatar-www')+"' class='profile-picture' alt='$alt'>";
}

function getBase64Image(img) {
    var canvas = document.createElement("canvas");
    canvas.width = img.width;
    canvas.height = img.height;

    var ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0);

    var dataURL = canvas.toDataURL("image/png");

    return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
}