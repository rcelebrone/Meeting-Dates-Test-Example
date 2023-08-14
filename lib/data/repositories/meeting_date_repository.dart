import 'package:schedule_agenda/data/datasources/remote_meeting_date_datasource.dart';
import 'package:schedule_agenda/domain/entities/meeting_date_entity.dart';

abstract class InterfaceMeetingDateRepository {
  Future<List<MeetingDateEntity>> getSharedMeetingDates();

  Future<void> saveMeetingDates(List<DateTime> dates);

  int count();
}

class MeetingDateRepository implements InterfaceMeetingDateRepository {
  final RemoteMeetingDateDataSource remoteDataSource;
  final _xpto = <int>[];

  MeetingDateRepository(this.remoteDataSource);

  @override
  Future<List<MeetingDateEntity>> getSharedMeetingDates() async {
    return await remoteDataSource.fetchSharedMeetingDates();
  }

  @override
  Future<void> saveMeetingDates(List<DateTime> dates) async {
    print("isso NÃO é um mock");
    _xpto.add(1);
    final list = dates.map((date) => MeetingDateEntity(data: date)).toList();
    await remoteDataSource.saveMeetingDates(list);
  }

  @override
  int count() => _xpto.length;
}
