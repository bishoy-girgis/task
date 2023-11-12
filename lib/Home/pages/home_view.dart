import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/Core/extentions/extentions.dart';
import 'package:task/Core/services/utils.dart';
import 'package:task/Home/manager/cubit.dart';
import 'package:task/Home/manager/states.dart';
import 'package:task/Home/widgets/custom_text_field.dart';
import 'package:task/Home/widgets/date_range.dart';
import 'package:task/Home/widgets/drop_down.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            var theme = Theme.of(context);
            var mediaQuery = MediaQuery.of(context).size;
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.webp"),
                      fit: BoxFit.cover)),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mediaQuery.height * 0.5,
                      ),
                      ClipPath(
                        clipper: TrapeziumClipper(),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 30),
                          decoration: BoxDecoration(color: theme.primaryColor),
                          child: Text(
                            "Hotels Search",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0XFFec8b24),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                  color: theme.accentColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: cubit.selectCityController,
                                    hintText: "Select city",
                                  ),
                                  DateRange(
                                    text:
                                        "${formatDate(cubit.dateTimeRange.start)}   =>   ${formatDate(cubit.dateTimeRange.end)} ",
                                    onTap: () {
                                      cubit.pickDateRange(context);
                                    },
                                  ),
                                  DropDown(
                                    dropdownValue: cubit.selectedNationality,
                                    onChanged: (String? newNationality) {
                                      cubit.changeNationality(newNationality!);
                                    },
                                    nationalityList: cubit.nationalityList,
                                  ),
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    width: mediaQuery.width,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 13)),
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Colors.white),
                                        shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              side: BorderSide(
                                                  color: theme.primaryColor)),
                                        ),
                                      ),
                                      onPressed: () {
                                        cubit.showAddRoomBottomSheet(context);
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${cubit.numberOfRooms} Room ,${cubit.numberOfAdults} Adult ,${cubit.numberOfChildren} Children",
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: theme.primaryColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Find Hotels"),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ).setPadding(context, vertical: 0.015)
                          ],
                        ),
                      ),
                    ],
                  ).setPadding(context, horizontal: 0.01),
                ),
              ),
            );
          }),
    );
  }
}

class TrapeziumClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0) // Top-left corner
      ..lineTo(size.width * 0.75, 0) // Top-right corner
      ..lineTo(size.width, size.height) // Bottom-right corner
      ..lineTo(0, size.height) // Bottom-left corner
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
