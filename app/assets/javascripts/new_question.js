$(function () {
  $(".radio_buttons").click(function() {
    if (this.id == "question_question_type_1") {
      $(".vassia").attr("value", "Зберегти й перейти до створення полів");
    } else if (this.id == "question_question_type_2" || this.id == "question_question_type_3") {
      $(".vassia").attr("value", "Зберегти");
    };
  });
});