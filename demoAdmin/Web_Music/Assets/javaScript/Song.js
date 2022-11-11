var submit = {
    init: function (url) {
        this.eventOwn(url);
    },
    eventOwn: function (url) {
        $('#saveChange').off('click').on('click', function () {
            a = $('#formDetail').serialize();
            $.ajax({
                url: url,
                type: 'POST',
                dataType: 'JSON',
                data: a,
                success: function (data) {
                    if (data.status) {
                        location.reload();
                    }
                    else{
                        alert("Loi");
                    }
                }
            });

        });
        
    }
}