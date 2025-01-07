import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/controllers/page_controller/page_state.dart';

class PageCubit extends Cubit<PageStates> {
  PageCubit() : super(WelcomeScreen());
}
