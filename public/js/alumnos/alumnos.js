const conductaTag = $("#conductaTag");
const observacionTag = $("#observacionTag");
const notasTag = $("#notasTag");

conductaTag.click(() => { changeView(1); });
observacionTag.click(() => { changeView(2); });
notasTag.click(() => { changeView(3); });

const offActiveTag = () => {
    conductaTag.removeClass('active');
    observacionTag.removeClass('active');
    notasTag.removeClass('active');
};

const changeView = (role) => {
    offActiveTag();
    switch (role) {
        case 1:
            conductaTag.addClass('active');
            $("#conducta").removeClass("d-none");
            $("#observaciones").addClass("d-none");
            $("#notas").addClass("d-none");
            break;
        case 2:
            observacionTag.addClass('active');
            $("#conducta").addClass("d-none");
            $("#observaciones").removeClass("d-none");
            $("#notas").addClass("d-none");
            break;
        case 3:
            notasTag.addClass('active');
            $("#conducta").addClass("d-none");
            $("#observaciones").addClass("d-none");
            $("#notas").removeClass("d-none");
            break;
        default:
            break;
    }
};