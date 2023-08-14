import 'package:flutter/material.dart';
import 'package:schedule_agenda/data/repositories/meeting_date_repository.dart';
import 'package:schedule_agenda/navigation_utils.dart';
import 'package:schedule_agenda/presentation/splash_screen.dart';

import '../domain/use_cases/share_meeting_dates_use_case.dart';
import 'date_option_widget.dart';

class DateCreateOptionsScreen extends StatefulWidget {
  final MeetingDateRepository meetingDateRepository;

  const DateCreateOptionsScreen(this.meetingDateRepository, {super.key});

  @override
  createState() => _DateCreateOptionsScreenState();
}

class _DateCreateOptionsScreenState extends State<DateCreateOptionsScreen> {
  final List<DateTime> selectedDates = [];
  BuildContext? _curContext;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _curContext = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar opções de agenda'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedDates.length,
              itemBuilder: (context, index) {
                final date = selectedDates[index];
                return DateOptionWidget(date: date);
              },
            ),
          ),
          Center(
            child: Row(children: [
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () => goToNextScreen(
                    _curContext!, SplashScreen(widget.meetingDateRepository)),
                child: const Text('Recarregar'),
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed:
                    _selectDate, // Chamar a função para selecionar data e hora
                child: const Text('Escolher datas'),
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () => _shareDates(selectedDates),
                child: const Text('Compartilhar opções'),
              ),
              const Spacer(flex: 1),
            ]),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: _curContext!,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDates.add(
            DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
                pickedTime.hour, pickedTime.minute),
          );
        });
      }
    }
  }

  void _shareDates(List<DateTime> dates) async {
    try {
      final shareUseCase =
          ShareMeetingDatesUseCase(widget.meetingDateRepository);

      await shareUseCase.execute(dates);

      ScaffoldMessenger.of(_curContext!).showSnackBar(const SnackBar(
        content: Text('Datas compartilhadas com sucesso'),
      ));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(_curContext!).showSnackBar(const SnackBar(
        content: Text('Erro ao compartilhar datas'),
      ));
    }
  }
}
