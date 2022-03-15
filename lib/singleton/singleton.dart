import 'package:things_to_do/models/new_task_model.dart';
import 'package:things_to_do/utils/colors.dart';

class Singleton {
  Singleton();

  static final instance = Singleton();

  List<NewTask> newTaskDataList = [
    NewTask(
      taskName: "Meeting With Client",
      taskDescription: "Job Meeting",
      taskCategory: "Official",
      // taskDateTime: ,
      taskPriority: AppColors().redColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Launch with Julie",
      taskDescription: "Family Meeting",
      taskCategory: "Family",
      // taskDateTime: ,
      taskPriority: AppColors().orangeColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Meet Joshep",
      taskDescription: "",
      taskCategory: "Friend",
      // taskDateTime: ,
      taskPriority: AppColors().blueColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Go to Pharmacy",
      taskDescription: "",
      taskCategory: "Health",
      // taskDateTime: ,
      taskPriority: AppColors().redColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Take Zsombek for a walk",
      taskDescription: "",
      taskCategory: "Fitness",
      // taskDateTime: ,
      taskPriority: AppColors().greenColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Call Mom",
      taskDescription: "",
      taskCategory: "Family",
      // taskDateTime: ,
      taskPriority: AppColors().blueColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Meeting with client",
      taskDescription: "",
      taskCategory: "Official",
      // taskDateTime: ,
      taskPriority: AppColors().redColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Call Mom",
      taskDescription: "",
      taskCategory: "Family",
      // taskDateTime: ,
      taskPriority: AppColors().blueColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Meeting with client",
      taskDescription: "",
      taskCategory: "Official",
      // taskDateTime: ,
      taskPriority: AppColors().redColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
    NewTask(
      taskName: "Meeting with client",
      taskDescription: "",
      taskCategory: "Official",
      // taskDateTime: ,
      taskPriority: AppColors().redColor,
      isDone: false,
      isLater: false,
      isDeleted: false,
      isFavorite: false,
      taskNotification: "",
    ),
  ];
}
