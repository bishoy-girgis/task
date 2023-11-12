import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/Home/manager/states.dart';

import '../widgets/add_room_bottom_sheet.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  TextEditingController? selectCityController;
   List<String>? childAges;
   bool pet = false;
  int numberOfRooms = 0;
  int numberOfAdults = 0;
  int numberOfChildren = 0;
  String? selectedNationality;
  List<String> nationalityList = [
    'Egyptian',
    'USA',
    'Canada',
    'United Kingdom',
    'Germany',
    'France',
    'Japan',
  ];

  DateTimeRange dateTimeRange = DateTimeRange(
    start: DateTime(2023, 11, 15),
    end: DateTime(2023, 11, 25),
  );

  pickDateRange(context) async {
    emit(DateLoadingState());
    DateTimeRange? newDate = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            accentColor: Colors.black,
            colorScheme: const ColorScheme.light(primary: Colors.blue),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            textTheme: const TextTheme(
              bodyText2:
                  TextStyle(color: Colors.black), // Customize the text color
            ),
          ),
          child: child!,
        );
      },
      initialDateRange: dateTimeRange,
    );
    if (newDate == null) {
      emit(DateErrorState());
      return;
    }
    emit(DateSuccessState());
    dateTimeRange = newDate;
  }

  void changeNationality(String newNationality) {
    selectedNationality = newNationality;
    emit(ChangeNationalitySuccessState());
  }
  changePetFriendly(bool value){
    pet = value;
    emit(ChangePetSuccessState());
  }

  addRoom(){
    numberOfRooms++;
    emit(AddRoomSuccessState());
  }

  removeRoom(){
    if(numberOfRooms<=0){
      return ;
    }
    numberOfRooms--;
    emit(RemoveRoomSuccessState());
  }

  addAdult(){
    if(numberOfAdults>=4){
      return ;
    }
    numberOfAdults++;
    emit(AddChildrenSuccessState());
  }

  removeAdult(){
    if(numberOfAdults<=0){
      return ;
    }
    numberOfAdults--;
    emit(RemoveChildrenSuccessState());
  }
  addChildren(){
    if(numberOfChildren>=5){
      return ;
    }
    numberOfChildren++;
    childAges = List<String>.filled(numberOfChildren, '');
    emit(AddChildrenSuccessState());
  }

  removeChildren(){
    if(numberOfChildren<=0){
      return ;
    }
    numberOfChildren--;
    childAges = List<String>.filled(numberOfChildren, '');
    emit(RemoveChildrenSuccessState());
  }

   showAddRoomBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const AddRoomBottomSheet();
      },
    );
    if (result != null && result is Map<String, int>) {
        numberOfRooms = result['rooms'] ?? 0;
        numberOfAdults = result['adults'] ?? 0;
        numberOfChildren = result['children'] ?? 0;
        emit(SaveRoomSuccessState());
    }
  }
}
