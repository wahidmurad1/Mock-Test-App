
import 'package:mock_test_app/utils/constants/imports.dart';

class ScheduleRewardController extends GetxController{
    Rx<DateTime> selectAppointmentDate = Rx<DateTime>(DateTime.now());
  RxString appoinmentDate = RxString("");
}