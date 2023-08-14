import 'package:flutter/material.dart';
import 'package:schedule_agenda/data/repositories/meeting_date_repository.dart';
import 'package:schedule_agenda/domain/use_cases/get_shared_meeting_dates_use_case.dart';
import 'package:schedule_agenda/navigation_utils.dart';
import 'date_create_options_screen.dart';
import 'date_view_options_screen.dart';

class SplashScreen extends StatefulWidget {
  final MeetingDateRepository meetingDateRepository;

  const SplashScreen(this.meetingDateRepository, {super.key});

  @override
  createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BuildContext? _curContext;
  final _seconds = const Duration(seconds: 1);

  void _navigateToNextScreen() async {
    await Future.delayed(_seconds);
    final getSharedMeetingDatesUseCase =
        GetSharedMeetingDatesUseCase(widget.meetingDateRepository);
    final sharedDates = await getSharedMeetingDatesUseCase.execute();

    print(sharedDates.length);

    if (sharedDates.isNotEmpty && _curContext != null) {
      goToNextScreen(_curContext!,
          DateViewOptionsScreen(widget.meetingDateRepository, sharedDates));
    } else if (_curContext != null) {
      goToNextScreen(
          _curContext!, DateCreateOptionsScreen(widget.meetingDateRepository));
    }
  }

  @override
  void initState() {
    super.initState();
    _curContext = context;
    _navigateToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event),
            Text('Alinhamento de agenda'),
          ],
        ),
      ),
    );
  }
}
