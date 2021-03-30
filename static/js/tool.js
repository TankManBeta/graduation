$("#tool").on("click", function (event) {
    event.preventDefault();
    $.ajax({
        type: "post",
        url: "/tool"
    })
});