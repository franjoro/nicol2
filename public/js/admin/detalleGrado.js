$("#navAlumnos").click( ()=> {
    $("#navMaterias").removeClass("active")
    $("#navAlumnos").addClass("active")
    $("#alumnosSection").removeClass("d-none")
    $("#materiasSection").addClass("d-none")
} )

$("#navMaterias").click( ()=> {
    $("#navAlumnos").removeClass("active")
    $("#navMaterias").addClass("active")
    $("#materiasSection").removeClass("d-none")
    $("#alumnosSection").addClass("d-none")
    
} )

// d-none