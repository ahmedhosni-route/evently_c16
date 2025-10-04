import 'package:animate_do/animate_do.dart';
import 'package:evently_c16_online/modules/layout/manager/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/models/category_model.dart';
import '../../../core/theme/app_colors.dart';
import '../services/layout_services.dart';

class LoveScreen extends StatelessWidget {
  const LoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Consumer<LayoutProvider>(builder: (context, provider, child) {
      return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: provider.favList.length,
        itemBuilder: (context, index) {
          var event = provider.favList[index];
          return FadeInUp(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              height: size.height * 0.26,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.primaryColor),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(event.image)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: [
                        Text(
                          DateFormat("d").format(
                            DateTime.parse(event.date),
                          ),
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor),
                        ),
                        Text(
                          DateFormat("MMM").format(
                            DateTime.parse(event.date),
                          ),
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(14)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            event.title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkColor),
                          ),
                        ),
                        IconButton(
                            padding: const EdgeInsets.all(4),
                            onPressed: () {
                              provider.toggleFav(event);
                            },
                            icon: Icon(
                              event.isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border_rounded,
                              color: AppColors.primaryColor,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },);
  }
}
