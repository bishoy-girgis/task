import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/Core/extentions/extentions.dart';
import 'package:task/Home/manager/states.dart';
import '../manager/cubit.dart';

class AddRoomBottomSheet extends StatelessWidget {
  const AddRoomBottomSheet({super.key});

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
              color: const Color(0XFFe3e4e5),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: mediaQuery.width,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Center(
                        child: Text(
                          "Rooms and Guests",
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.03,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Text(
                            "Rooms",
                            style: theme.textTheme.displayMedium,
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () => cubit.removeRoom(),
                              icon: const Icon(CupertinoIcons.minus_circle),
                              color: theme.primaryColor,
                              iconSize: 28),
                          Text(
                            "${cubit.numberOfRooms}",
                            style: theme.textTheme.displayMedium,
                          ),
                          IconButton(
                              onPressed: () => cubit.addRoom(),
                              icon: const Icon(CupertinoIcons.plus_circle),
                              color: theme.primaryColor,
                              iconSize: 28)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                      width: mediaQuery.width,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Room 1",
                            style: theme.textTheme.displayMedium,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Adults",
                                style: theme.textTheme.displaySmall,
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () => cubit.removeAdult(),
                                  icon:
                                      const Icon(CupertinoIcons.minus_circle),
                                  color: theme.primaryColor,
                                  iconSize: 28),
                              Text(
                                "${cubit.numberOfAdults}",
                                style: theme.textTheme.displayMedium,
                              ),
                              IconButton(
                                  onPressed: () => cubit.addAdult(),
                                  icon:
                                      const Icon(CupertinoIcons.plus_circle),
                                  color: theme.primaryColor,
                                  iconSize: 28)
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Children",
                                style: theme.textTheme.displaySmall,
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () => cubit.removeChildren(),
                                  icon:
                                      const Icon(CupertinoIcons.minus_circle),
                                  color: theme.primaryColor,
                                  iconSize: 28),
                              Text(
                                "${cubit.numberOfChildren}",
                                style: theme.textTheme.displayMedium,
                              ),
                              IconButton(
                                  onPressed: () => cubit.addChildren(),
                                  icon:
                                      const Icon(CupertinoIcons.plus_circle),
                                  color: theme.primaryColor,
                                  iconSize: 28)
                            ],
                          ),
                          cubit.numberOfChildren == 0
                              ? const SizedBox()
                              : SizedBox(
                                  width: mediaQuery.width,
                                  height: mediaQuery.height * 0.18,
                                  child: ListView.builder(
                                    itemCount: cubit.numberOfChildren,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Age of Child ${index + 1}:',
                                              style: theme
                                                  .textTheme.displaySmall,
                                            ),
                                            SizedBox(
                                                width:
                                                    mediaQuery.width * 0.14),
                                            Expanded(
                                              child: TextField(
                                                keyboardType:
                                                    TextInputType.number,
                                                onChanged: (value) {
                                                  cubit.childAges![index] =
                                                      value;
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Enter Age ',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          SizedBox(
                            height: MediaQuery.of(context).viewInsets.bottom,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pet-friendly !",
                                style: theme.textTheme.displayMedium,
                              ),
                              Text(
                                "Only show stays that allow pets",
                                style: theme.textTheme.displaySmall,
                              ),
                            ],
                          ),
                          Spacer(),
                          Switch(
                            value: cubit.pet,
                            activeColor: theme.primaryColor,
                            onChanged: (bool value) {
                              cubit.changePetFriendly(value);
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                    ),
                    Container(
                      width: mediaQuery.width,
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(theme.primaryColor),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14)))),
                          onPressed: () {
                            Navigator.of(context).pop({
                              'rooms': cubit.numberOfRooms,
                              'adults': cubit.numberOfAdults,
                              'children': cubit.numberOfChildren
                            });
                          },
                          child: Text(
                            "Apply",
                            style: theme.textTheme.bodyMedium,
                          ).setPadding(context, vertical: 0.014)),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
