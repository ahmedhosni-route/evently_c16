import 'package:animate_do/animate_do.dart';
import 'package:evently_c16_online/core/models/category_model.dart';
import 'package:evently_c16_online/core/provider/app_provider.dart';
import 'package:evently_c16_online/core/theme/app_colors.dart';
import 'package:evently_c16_online/modules/layout/manager/layout_provider.dart';
import 'package:evently_c16_online/modules/layout/services/layout_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    var user = FirebaseAuth.instance.currentUser;
    return Consumer<LayoutProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                color: theme.primaryColorDark,
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back ✨",
                                style: TextStyle(color: AppColors.lightColor),
                              ),
                              Text(
                                (user?.displayName ?? "").toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: AppColors.lightColor),
                              ),
                            ],
                          ),
                        ),
                        appProvider.isDark
                            ? Image.asset(
                                "assets/icons/dark.png",
                                width: 40,
                                height: 40,
                                color: Colors.white,
                              )
                            : Image.asset(
                                "assets/icons/light.png",
                                width: 40,
                                height: 40,
                              ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.lightColor,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            appProvider.locale.toUpperCase(),
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Iconsax.location_outline,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Cairo , Egypt",
                          style: TextStyle(color: AppColors.lightColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DefaultTabController(
                        length: CategoryData.categoriesWithAll.length,
                        child: TabBar(
                            onTap: (value) {
                              provider.onTabChange(value);
                            },
                            labelPadding: const EdgeInsets.all(4),
                            isScrollable: true,
                            dividerColor: Colors.transparent,
                            indicatorColor: Colors.transparent,
                            tabAlignment: TabAlignment.start,
                            labelColor: AppColors.primaryColor,
                            unselectedLabelColor: Colors.white,
                            tabs: CategoryData.categoriesWithAll.map(
                              (e) {
                                int index =
                                    CategoryData.categoriesWithAll.indexOf(e);
                                bool isSelected = index == provider.tabIndex;
                                return Tab(
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: isSelected ? Colors.white : null,
                                        border: Border.all(color: Colors.white),
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
                  ],
                ),
              ),
            ),
            Expanded(
                child: StreamBuilder(
              stream: LayoutServices.getEventsStream(
                  CategoryData.categoriesWithAll[provider.tabIndex].id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  var data = snapshot.data!.docs;
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var event = data[index].data();
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
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
          ],
        );
      },
    );
  }
}
