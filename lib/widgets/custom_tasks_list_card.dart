import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';
import 'custom_circle.dart';

class BuildTasksListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    String timeNow = DateFormat('kk:mm \n a').format(now);

    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return buildSlidable(context, size, timeNow);
        },
      ),
    );
  }

  Widget buildSlidable(BuildContext context, Size size, String timeNow) {
    void doNothing(BuildContext context) {}
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: AppColors().greenColor,
            foregroundColor: AppColors().whiteColor,
            icon: Icons.done,
            label: 'Save',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: AppColors().redColor,
            foregroundColor: AppColors().whiteColor,
            icon: Icons.watch_later_outlined,
            label: 'Later',
          ),
        ],
      ),
      child: taskListCard(size, timeNow),
    );
  }

  Widget taskListCard(Size size, String timeNow) {
    return Container(
      width: size.width,
      height: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors().whiteColor,
          border: Border.all(
            color: AppColors().lightGreyColor.withOpacity(0.5),
          )),
      child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeNow,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors().greyColor,
              ),
            ),
          ],
        ),
        title: Text(
          "Meting with client",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors().greyColor,
            letterSpacing: 1.0,
          ),
        ),
        subtitle: Text(
          "Official",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
        ),
        trailing: Container(
          width: 80,
          // height: 60,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.star_border_outlined,
                  size: 26,
                ),
              ),
              buildCustomCircle(
                color: AppColors().orangeColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
