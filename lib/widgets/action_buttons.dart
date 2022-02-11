// @dart=2.9
import 'package:flutter_application_2/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final UserCubit userCubit = context.bloc<UserCubit>();
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  userCubit.fetchUsers();
                },
                child: Text('Load users'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[700],
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
            SizedBox(width: 20),
            ElevatedButton(
                onPressed: () {
                  userCubit.clearUsers();
                },
                child: Text('Clear users'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber[700],
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}