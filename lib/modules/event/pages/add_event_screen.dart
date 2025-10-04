import 'package:evently_c16_online/core/widgets/custom_btn.dart';
import 'package:evently_c16_online/modules/event/manager/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/models/category_model.dart';
import '../../../core/theme/app_colors.dart';

class AddEventScreen extends StatelessWidget {
  const AddEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: Consumer<EventProvider>(
        builder: (context, provider, child) {
          return Scaffold(
              bottomNavigationBar: Container(
                padding: const EdgeInsets.all(12),
                child: CustomBtn(onTap: () {
                  provider.addEvent(context);
                }, text: "Add Event"),
              ),
              appBar: AppBar(
                title: const Text("Create Event"),
              ),
              body: SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.asset(
                                CategoryData
                                    .categories[provider.tabIndex].image,
                                height: 220,
                                gaplessPlayback: true,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            DefaultTabController(
                                length: CategoryData.categories.length,
                                child: TabBar(
                                    onTap: (value) {
                                      provider.onTabChange(value);
                                    },
                                    labelPadding: const EdgeInsets.all(4),
                                    isScrollable: true,
                                    dividerColor: Colors.transparent,
                                    indicatorColor: Colors.transparent,
                                    tabAlignment: TabAlignment.start,
                                    unselectedLabelColor:
                                        AppColors.primaryColor,
                                    labelColor: Colors.white,
                                    tabs: CategoryData.categories.map(
                                      (e) {
                                        int index =
                                            CategoryData.categories.indexOf(e);
                                        bool isSelected =
                                            index == provider.tabIndex;
                                        return Tab(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: isSelected
                                                    ? AppColors.primaryColor
                                                    : null,
                                                border: Border.all(
                                                    color:
                                                        AppColors.primaryColor),
                                                borderRadius:
                                                    BorderRadius.circular(24)),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.sports),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Text(e.name),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList())),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text("Title"),
                            TextFormField(
                              controller: provider.titleController,
                              onTapOutside: (event) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              decoration: const InputDecoration(
                                  hintText: "Event Title",
                                  prefixIcon: ImageIcon(
                                      AssetImage("assets/icons/edit.png"))),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            const Text("Description"),
                            SizedBox(
                              height: 160,
                              child: TextFormField(
                                controller: provider.descriptionController,
                                onTapOutside: (event) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                textAlignVertical: TextAlignVertical.top,
                                maxLines: null,
                                expands: true,
                                decoration: const InputDecoration(
                                  hintText: "Event Description",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.date_range_rounded),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Event Date",
                                  style: theme.textTheme.titleMedium,
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      initialDate: provider.selectedDate ??
                                          DateTime.now(),
                                      currentDate: provider.selectedDate,
                                      lastDate: DateTime.now().add(
                                        const Duration(days: 365),
                                      ),
                                    ).then(
                                      (value) {
                                        provider.onSelectedDate(
                                            value ?? DateTime.now());
                                      },
                                    );
                                  },
                                  child: Text(
                                    provider.selectedDate == null
                                        ? "Selected Date"
                                        : DateFormat("y - MMM - d")
                                            .format(provider.selectedDate!),
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(
                                            color: AppColors.primaryColor),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.timelapse_outlined),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Event Time",
                                  style: theme.textTheme.titleMedium,
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: provider.selectedTime ??
                                          TimeOfDay.now(),
                                    ).then(
                                      (value) {
                                        provider.onSelectedTime(
                                            value ?? TimeOfDay.now());
                                      },
                                    );
                                  },
                                  child: Text(
                                    provider.selectedTime?.format(context) ??
                                        "Selected Time",
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(
                                            color: AppColors.primaryColor),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ))));
        },
      ),
    );
  }
}
