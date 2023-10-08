import 'package:intl/intl.dart';
import 'package:mock_test_app/controllers/schedule_reward_controller.dart';
import 'package:mock_test_app/utils/constants/imports.dart';

class GlobalController extends GetxController {
  //* parent route
  final RxString parentRoute = RxString("");

  //*Bottom Navigation bar index
  RxInt bottomNavBarIndex = RxInt(0);
  final screens = [
    krHomeScreen,
    krTestScreen,
    krProfile,
    krHomeScreen,
  ];

  //*Test Screen Search
  final RxBool isTestSearching = RxBool(false);
  final TextEditingController testSearchController = TextEditingController();

//*Single Date Picker
  Future<void> datePicker(BuildContext context) async {
    ScheduleRewardController scheduleRewardController = Get.find<ScheduleRewardController>();
    DateTime? pickStartDate = await showDatePicker(
        context: context, initialDate: scheduleRewardController.selectAppointmentDate.value, firstDate: DateTime.now(), lastDate: DateTime(2101));
    if (pickStartDate != null) {
      if (scheduleRewardController.selectAppointmentDate.value.isAfter(pickStartDate)) {
        // scheduleRewardController.visitTime.value = '';
        // hrController.selectedVisitTime.value = DateTime.now();
      }
      scheduleRewardController.selectAppointmentDate.value = pickStartDate;
      scheduleRewardController.appoinmentDate.value = DateFormat('dd MMMM yyyy').format(pickStartDate);
    }
  }
}
