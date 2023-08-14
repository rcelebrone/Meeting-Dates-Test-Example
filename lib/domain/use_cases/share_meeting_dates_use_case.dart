import '../../data/repositories/meeting_date_repository.dart';

class ShareMeetingDatesUseCase {
  final InterfaceMeetingDateRepository repository;
  ShareMeetingDatesUseCase(this.repository);

  Future<String> execute(List<DateTime> dates) async {
    if (dates.isEmpty) {
      throw ArgumentError('A lista de datas não pode estar vazia');
    }
    // Gerar um link com as datas compartilhadas
    final link = generateLink(dates);

    // Gravar as opções de meeting no repositório
    await repository.saveMeetingDates(dates);

    print(repository.count());

    // Retornar o link gerado
    return link;
  }

  String generateLink(List<DateTime> dates) {
    // Implementar a lógica para gerar o link com as datas compartilhadas
    // Por exemplo, você pode concatenar as datas formatadas em uma URL
    // Exemplo: "https://seuapp.com/meeting-dates?dates=2023-08-10T15:30:00Z,2023-08-11T10:00:00Z"
    return "https://seuapp.com/meeting-dates?dates=${dates.map((date) => date.toIso8601String()).join(",")}";
  }
}
