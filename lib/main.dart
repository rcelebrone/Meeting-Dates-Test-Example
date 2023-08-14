import 'package:flutter/material.dart';
import 'package:schedule_agenda/presentation/splash_screen.dart';
import 'package:schedule_agenda/data/repositories/meeting_date_repository.dart';
import 'package:schedule_agenda/data/datasources/remote_meeting_date_datasource.dart';

void main() {
  runApp(const MeetingSchedulerApp());
}

class MeetingSchedulerApp extends StatelessWidget {
  const MeetingSchedulerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteDataSource = RemoteMeetingDateDataSource();
    final repository = MeetingDateRepository(remoteDataSource);

    return MaterialApp(
        title: 'Alinhamento de agenda',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(repository));
  }
}
