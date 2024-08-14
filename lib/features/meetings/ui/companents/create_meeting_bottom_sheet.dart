import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sync_center_mobile/core/ui/reusables/buttons/default_button.dart';

import '../../../../core/ui/reusables/textfields/default_text_field.dart';
import '../../../../core/ui/theme/colors.dart';
import '../../../../core/utils/auth_validators.dart';
import '../cubits/meetings_cubit/meetings_cubit.dart';
import 'date_text_field.dart';
import 'package:intl/intl.dart';

class CreateMeetingBottomSheetComponent extends StatefulWidget {
  const CreateMeetingBottomSheetComponent({super.key, required this.onMeetingCreate});

  final void Function(String, String) onMeetingCreate;

  @override
  State<CreateMeetingBottomSheetComponent> createState() => _CreateMeetingBottomSheetComponentState();
}

class _CreateMeetingBottomSheetComponentState extends State<CreateMeetingBottomSheetComponent> {
  final subjectController = TextEditingController();

  final meetingDateController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String transformDate(String originalDate) {
    final DateFormat inputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    final DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    DateTime? parsedDate = inputFormat.parseStrict(originalDate);
    String formattedDate = outputFormat.format(parsedDate);

    return formattedDate;
  }


  void onMeetingPressed() {
    if (formKey.currentState!.validate()) {
      final title = subjectController.text;
      final meetingDate = transformDate(meetingDateController.text);
      BlocProvider.of<ClientMeetingsCubit>(context)
          .createMeeting(title: title, date: meetingDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Create Meeting",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: SyncColors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "This screen shows all your upcoming and past meetings. Tap any meeting to view its details and manage your schedule.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: SyncColors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultTextField(
                keyboardType: TextInputType.name,
                hint: "Example Meeting",
                label: const Text("Title"),
                validator: (value) => AuthValidators.validateEmpty(value!, context),
                controller: subjectController,
                inputColor: SyncColors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              DateTextField(
                keyboardType: TextInputType.datetime,
                hint: "5/5/2024",
                label: const Text("Meeting Date"),
                validator: (value) =>
                    AuthValidators.validateEmpty(value!, context),
                controller: meetingDateController,
                onTap: () => _selectDate(context),
                inputColor: SyncColors.black,
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: DefaultButton(
                  onPressed: onMeetingPressed,
                  text: 'Create Meeting',
                  textColor: Colors.white,
                  backgroundColor: SyncColors.lightBlue,
                  width: 206,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      initialDate: DateTime.now(),
    );
    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final DateTime fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        String formattedDateTime = DateFormat('MM/dd/yyyy hh:mm a').format(fullDateTime);
        meetingDateController.text = formattedDateTime;
      }
    }
  }
}
