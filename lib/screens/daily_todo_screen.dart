import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:things_to_do/utils/colors.dart';
import '../widgets/custom_tasks_list_card.dart';

class DailyTODOScreen extends StatelessWidget {
  const DailyTODOScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildCompletedTasksSection(),
        BuildTasksListCard(),
      ],
    );
  }

  Container buildCompletedTasksSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      height: 130,
      decoration: BoxDecoration(
        color: AppColors().whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Good Morning ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade700,
                ),
              ),
              const Text(
                "Naser",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TODAY",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors().primaryColor,
                  fontSize: 22,
                ),
              ),
              Text(
                "Completed",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors().greenColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat.yMMMd().format(DateTime.now()),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                width: 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "4/",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors().greenColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "10",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors().redColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
