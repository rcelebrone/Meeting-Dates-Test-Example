import 'package:schedule_agenda/data/repositories/meeting_date_repository.dart';
import 'package:schedule_agenda/domain/entities/meeting_date_entity.dart';

class GetSharedMeetingDatesUseCase {
  final MeetingDateRepository repository;

  GetSharedMeetingDatesUseCase(this.repository);

  Future<List<MeetingDateEntity>> execute() async {
    return await repository.getSharedMeetingDates();
  }
}
