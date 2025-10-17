var api = "http://localhost:51555/api/categories/"; 

$(document).ready(function () {
    displayCategories();
    $(document.body).on('click', 'a', function (e) {
        e.preventDefault();
        findCategory($(this).attr("href"));
    });
});

function findCategory(href) {
    $('#message').html("Finding...");
    $.support.cors = true;
    $.getJSON(href, function (data) {
        $('#id').val(data.CategoryID);
        $('#short').val(data.ShortName);
        $('#long').val(data.LongName);
        $('#message').text("");
    })
    .fail(showError);
}

function insertCat() {
    $('#message').text("Inserting...");
    $.support.cors = true;
    $.ajax({
        type: 'POST',
        url: api,
        data: $('#form1').serialize(),
        dataType: "json",
        success: displayCategories,
        error: showError
    });
}

function updateCat() {
    $('#message').text("Updating...");
    $.support.cors = true;
    $.ajax({
        type: 'PUT',
        url: api + $('#id').val(),
        data: $('#form1').serialize(),
        dataType: "json",
        success: displayCategories,
        error: showError
    });
}

function deleteCat() {

    $('#message').text("Deleting...");
    $.support.cors = true;
    $.ajax({
        type: 'DELETE',
        url: api + $('#id').val(),
        dataType: "json",
        success: displayCategories,
        error: showError
    });
}

function displayCategories() {
    $.support.cors = true;
    $.getJSON(api, function (data) {
        var rows = "";
        $.each(data, function (key, val) {
            rows += "<tr><td><a href=" + api + val.CategoryID + ">" + val.CategoryID + "</a></td>";
            rows += "<td>" + val.ShortName + "</td>";
            rows += "<td>" + val.LongName + "</td></tr>";
        });
        $('#message').text("");
        $("#categories > tbody tr").remove();
        $('#categories > tbody').append(rows);
    })
    .fail(showError);
}

function showError(jqXHR, textStatus, err) {
    $('#message').text('Error: ' + err);
}

function clearFields() {
    $('#id').val("");
    $('#short').val("");
    $('#long').val("");
    $('#message').text("");
}