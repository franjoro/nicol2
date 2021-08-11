$(document).ready( function () {
    $('#datatable').DataTable();
    const roleBimestre = $("#roleBimestre").val();
    $("#selectBimestre").val(roleBimestre);

} );

$( "#selectBimestre" ).change(function() {
    const value = $(this).val();
    window.location = "/admin/conducta/"+value;
});