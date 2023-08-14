import 'package:flutter/material.dart';
import 'package:schedule_agenda/data/repositories/meeting_date_repository.dart';
import 'package:schedule_agenda/domain/entities/meeting_date_entity.dart';
import 'package:schedule_agenda/navigation_utils.dart';
import 'package:schedule_agenda/presentation/date_create_options_screen.dart';

import 'date_option_widget.dart';

class DateViewOptionsScreen extends StatelessWidget {
  final List<MeetingDateEntity> sharedDates;
  final MeetingDateRepository meetingDateRepository;

  const DateViewOptionsScreen(this.meetingDateRepository, this.sharedDates,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opções de agendas disponíveis'),
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: sharedDates.length,
            itemBuilder: (context, index) {
              final option = sharedDates[index];
              return DateOptionWidget(date: option.data);
            },
          ),
        ),
        const Spacer(flex: 1),
        ElevatedButton(
          onPressed: () => goToNextScreen(
              context, DateCreateOptionsScreen(meetingDateRepository)),
          child: const Text('Criar opções para compartilhar'),
        ),
        const Spacer(flex: 1),
      ]),
    );
  }
}
