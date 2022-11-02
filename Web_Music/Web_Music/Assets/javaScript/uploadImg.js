function ShowImagePreview(imgeUploader, previewImage) {
    console.log(imgeUploader.files)
    if (imageUploader.files && imageUploader.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(previewImage).attr('src', e.target.result);
        }
        reader.readAsDataURL(imgeUploader.files[0]);
    }
}