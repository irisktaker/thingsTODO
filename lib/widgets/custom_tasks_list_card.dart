import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../singleton/singleton.dart';
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
        itemCount: Singleton.instance.newTaskDataList.length,
        itemBuilder: (context, index) {
          return buildSlidable(context, size, timeNow, index);
        },
      ),
    );
  }

  Widget buildSlidable(
      BuildContext context, Size size, String timeNow, int index) {
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
      child: taskListCard(size, timeNow, index),
    );
  }

  Widget taskListCard(Size size, String timeNow, int index) {
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
          Singleton.instance.newTaskDataList[index].taskName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors().greyColor,
            letterSpacing: 1.0,
          ),
        ),
        subtitle: Text(
          Singleton.instance.newTaskDataList[index].taskCategory,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
        ),
        trailing: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --
              StatefulBuilder(
                builder: ((context, setState) => IconButton(
                      onPressed: () {
                        setState(() {
                          Singleton.instance.newTaskDataList[index].isFavorite =
                              !Singleton
                                  .instance.newTaskDataList[index].isFavorite;
                        });
                      },
                      icon: Singleton.instance.newTaskDataList[index].isFavorite
                          ? Icon(
                              Icons.star,
                              color: AppColors().yellowColor,
                              size: 26,
                            )
                          : const Icon(
                              Icons.star_border_outlined,
                              size: 26,
                            ),
                    )),
              ),
              buildCustomCircle(
                color: Singleton.instance.newTaskDataList[index].taskPriority,
              )
            ],
          ),
        ),
      ),
    );
  }
}
