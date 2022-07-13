class Event {
  final String id;
  final String title;
  final String subTitle;
  final DateTime inicialDateTime;
  final DateTime finalDateTime;
  //Localização
  //ocupado
  //criar outra classe para agendamento-premuim


  const Event({
    this.id = "",
    required this.title,
    required this.subTitle,
    required this.inicialDateTime,
    required this.finalDateTime,
  });

  Map<String, dynamic> toJson()=>{
    "id" : id,
    "title" : title,
    "subTitle" : subTitle,
    "inicialDateTime": inicialDateTime,
    "finalDateTime" : finalDateTime
  };

  @override
  String toString() => title;
}