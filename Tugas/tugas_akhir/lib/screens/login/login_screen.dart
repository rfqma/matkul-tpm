import 'package:flutter/material.dart';
import 'package:tugas_akhir/screens/Login/sign-in.dart';
import 'package:tugas_akhir/screens/Login/sign-up.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/app/base_screen.dart';
import 'package:tugas_akhir/widgets/app/custom_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late TabController _tabController;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      // print("select index: " + _selectedIndex.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseScreen(
        bodyContainer: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: ListView(
        children: [
          SizedBox(
            height: size.height * 0.08,
          ),
          CustomContainer(
            width: MediaQuery.of(context).size.width * 0.8,
            borderRadius: 60,
            height: 60,
            child: TabBar(
              controller: _tabController,
              physics: const ClampingScrollPhysics(),
              indicator: BoxDecoration(
                color: kWhite.withOpacity(1),
                borderRadius: BorderRadius.circular(30),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: kWhite,
              unselectedLabelColor: kBlack,
              tabs: const <Widget>[
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Sign In',
                      style: kTitleStyle,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Sign Up',
                    style: kTitleStyle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          CustomContainer(
            width: size.width * 0.8,
            height: size.height * 0.65,
            child: TabBarView(
              controller: _tabController,
              children: const [
                SignIn(),
                SignUp(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
