import 'package:evently_c16_online/core/models/category_model.dart';
import 'package:evently_c16_online/core/models/event_model.dart';
import 'package:evently_c16_online/modules/event/services/event_servcies.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  int tabIndex = 0;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isLoading = false;

  void onTabChange(int index) {
    tabIndex = index;
    notifyListeners();
  }

  void onSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void onSelectedTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }

  Future<void> addEvent(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    EventModel eventModel = EventModel(
        id: "1",
        title: titleController.text,
        time: selectedTime!.format(context),
        date: selectedDate!.toString(),
        image: CategoryData.categories[tabIndex].image,
        desc: descriptionController.text,
      categoryId: CategoryData.categories[tabIndex].id

    );
    await EventServices.addEvent(eventModel);
    isLoading = false;
    notifyListeners();
    Navigator.pop(context);
  }
}
