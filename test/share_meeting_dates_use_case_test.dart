import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
import 'package:schedule_agenda/domain/entities/meeting_date_entity.dart';
import 'package:schedule_agenda/domain/use_cases/share_meeting_dates_use_case.dart';
import 'package:schedule_agenda/data/repositories/meeting_date_repository.dart';

// class MockMeetingDateRepository extends Mock implements MeetingDateRepository {
//   @override
//   Future<void> saveMeetingDates(List<DateTime> dates) async {
//     print("isso é um mock");
//   }

//   @override
//   int count() => 100;
// }

class MockMeetingDateRepository extends InterfaceMeetingDateRepository {
  @override
  int count() => 100;

  @override
  Future<List<MeetingDateEntity>> getSharedMeetingDates() async {
    return <MeetingDateEntity>[];
  }

  @override
  Future<void> saveMeetingDates(List<DateTime> dates) async {
    print("isso é um mock");
  }
}

void main() {
  late ShareMeetingDatesUseCase shareMeetingDatesUseCase;
  late MockMeetingDateRepository mockMeetingDateRepository;

  setUp(() {
    mockMeetingDateRepository = MockMeetingDateRepository();
    shareMeetingDatesUseCase =
        ShareMeetingDatesUseCase(mockMeetingDateRepository);
  });

  test('execute() should generate correct link', () async {
    // Arrange
    final dates = [
      DateTime(2023, 8, 10, 15, 30),
      DateTime(2023, 8, 11, 10, 0),
    ];
    const expectedLink =
        'https://seuapp.com/meeting-dates?dates=2023-08-10T15:30:00.000,2023-08-11T10:00:00.000';

    // Act
    final result = await shareMeetingDatesUseCase.execute(dates);

    // Assert
    expect(result, expectedLink);
  });

  test('execute() should throw ArgumentError for empty date list', () async {
    // Arrange
    final dates = <DateTime>[];

    // Assert
    expect(() async {
      // Act
      await shareMeetingDatesUseCase.execute(dates);
    }, throwsA(isA<ArgumentError>()));
  });
}
