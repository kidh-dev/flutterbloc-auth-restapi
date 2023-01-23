import 'package:desain/bloc/auth_bloc/auth_bloc.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:desain/style/theme.dart' as Style;
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://yt3.ggpht.com/ytc/AMLnZu_R_hG8ECmXhQKgKOvNboKgS6x6YHgLa09z90prDJMc7YSiuQAMeFsbqHakExzr=s88-c-k-c0x00ffffff-no-rj-mo"),
          ),
        ),
        title: const Text("AUTH WITH REST"),
        actions: [
          IconButton(onPressed: (){
            BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
          }, icon: const Icon(EvaIcons.logOutOutline))
        ],
      ),
      body: const Center(
        child: Text("Main Screen"),
      ),
    );
  }
}
