// @dart=2.9
import 'package:flutter_application_2/cubit/user_state.dart';
import 'package:flutter_application_2/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              'No data received. \nPress button "Load users"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10),
              color: Colors.amber[50],
              child: ListTile(
                leading: Text(
                  '${state.loadedUser[index].id}',
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${state.loadedUser[index].name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    
                  ],
                ),
                subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Email: ${state.loadedUser[index].email}',
                        ),
                        Text(
                          'Phone: ${state.loadedUser[index].phone}',
                        ),
                      ],
                    ),),
              ),
            );
        }

        if (state is UserErrorState) {
          return Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return null;
      },
    );
  }
}