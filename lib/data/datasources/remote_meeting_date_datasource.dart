import "dart:async";

import "package:schedule_agenda/domain/entities/meeting_date_entity.dart";

class RemoteMeetingDateDataSource {
  late List<MeetingDateEntity> _meetingDateEntityList = <MeetingDateEntity>[];

  RemoteMeetingDateDataSource() {
    if (_meetingDateEntityList.isEmpty) {
      _meetingDateEntityList = _mockMeetingDates();
    }
  }

  List<MeetingDateEntity> _mockMeetingDates() {
    final now = DateTime.now();
    final List<MeetingDateEntity> meetingDates = [];

    for (int i = 0; i < 5; i++) {
      final date = now.add(Duration(days: i));
      final meetingDate = MeetingDateEntity(
        data: date,
        confirmado: false,
      );
      meetingDates.add(meetingDate);
    }

    return meetingDates;
  }

  Future<List<MeetingDateEntity>> fetchSharedMeetingDates() async {
    print("recuperou do banco");
    return _meetingDateEntityList;
  }

  Future<void> saveMeetingDates(List<MeetingDateEntity> dates) async {
    print("gravou no banco");
    _meetingDateEntityList.addAll(dates);
  }
}
