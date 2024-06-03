import 'package:bmi/components/action_button.dart';
import 'package:bmi/components/gender_component.dart';
import 'package:bmi/components/height_component.dart';
import 'package:bmi/components/input.dart';
import 'package:bmi/domain/gender.dart';
import 'package:bmi/result_page.dart';
import 'package:bmi/theme.dart';
import 'package:bmi/viewmodels/action_viewmodel.dart';
import 'package:bmi/viewmodels/home_viewmodel.dart';
import 'package:bmi/viewmodels/result_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/gender_viewmodel.dart';
import 'viewmodels/height_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GenderViewModel genderViewModel = GenderViewModel();
  final HeightViewModel heightViewModel = HeightViewModel();
  final ActionViewModel<double> weightViewModel =
      ActionViewModel(title: 'WEIGHT', value: 20);
  final ActionViewModel<int> ageViewModel =
      ActionViewModel(title: 'Age', value: 20);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => genderViewModel),
          ChangeNotifierProvider(create: (context) => heightViewModel),
          ChangeNotifierProvider(create: (context) => weightViewModel),
          ChangeNotifierProvider(create: (context) => ageViewModel),
          ChangeNotifierProxyProvider4<GenderViewModel, HeightViewModel,
              ActionViewModel<double>, ActionViewModel<int>, HomeViewModel>(
            create: (context) => HomeViewModel(
              genderViewModel: genderViewModel,
              ageViewModel: ageViewModel,
              heightViewModel: heightViewModel,
              weightViewModel: weightViewModel,
            ),
            update: (context, gender, height, weight, age, home) =>
                HomeViewModel(
              genderViewModel: gender,
              ageViewModel: age,
              heightViewModel: height,
              weightViewModel: weight,
            ),
          ),
        ],
        child: const MyHomePage(
          title: "BMI calculator",
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.appBarBackground,
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
          ),
          backgroundColor: AppColor.appBarBackground,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(41, 31, 41, 31),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<HomeViewModel>(
                        builder: (context, homeViewModel, child) {
                          return GenderComponent(
                            icon: homeViewModel.genderViewModel.femaleIcon,
                            title: homeViewModel.genderViewModel.femaleTitle,
                            color: homeViewModel.genderViewModel.femaleColor,
                            isSelected:
                                homeViewModel.genderViewModel.isFemaleSelected,
                            onSelected: () {
                              homeViewModel.genderViewModel
                                  .setGender(Gender.female);
                            },
                          );
                        },
                      ),
                      Consumer<HomeViewModel>(
                        builder: (context, homeViewModel, child) {
                          return GenderComponent(
                            icon: homeViewModel.genderViewModel.maleIcon,
                            title: homeViewModel.genderViewModel.maleTitle,
                            color: homeViewModel.genderViewModel.maleColor,
                            isSelected:
                                homeViewModel.genderViewModel.isMaleSelected,
                            onSelected: () {
                              homeViewModel.genderViewModel
                                  .setGender(Gender.male);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 57),
                  Consumer<HomeViewModel>(
                    builder: (context, homeViewModel, child) {
                      return HeightComponent(
                        value: homeViewModel.heightViewModel.value,
                        onChanged: (value) {
                          homeViewModel.heightViewModel.setValue(value);
                        },
                        title: homeViewModel.heightViewModel.title,
                        unit: homeViewModel.heightViewModel.unitTitle,
                        minValue: homeViewModel.heightViewModel.minValue,
                        maxValue: homeViewModel.heightViewModel.maxValue,
                      );
                    },
                  ),
                  const SizedBox(height: 57),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<HomeViewModel>(
                        builder: (context, homeViewModel, child) {
                          return InputComponent(
                            title: homeViewModel.weightViewModel.title,
                            value: homeViewModel.weightViewModel.valueString,
                            onSubtractPressed: () {
                              homeViewModel.weightViewModel.decrement();
                            },
                            onPlusPressed: () {
                              homeViewModel.weightViewModel.increment();
                            },
                          );
                        },
                      ),
                      Consumer<HomeViewModel>(
                        builder: (context, homeViewModel, child) {
                          return InputComponent(
                            title: homeViewModel.ageViewModel.title,
                            value: homeViewModel.ageViewModel.value.toString(),
                            onSubtractPressed: () {
                              homeViewModel.ageViewModel.decrement();
                            },
                            onPlusPressed: () {
                              homeViewModel.ageViewModel.increment();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 57),
                  ActionButton(
                      title: 'CALCULATE',
                      onPressed: () {
                        HomeViewModel viewModel =
                            Provider.of<HomeViewModel>(context, listen: false);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ResultPage(
                                  info: ResultInputInfo(
                                    height: viewModel.heightViewModel.value,
                                    weight: viewModel.weightViewModel.value,
                                    age: viewModel.ageViewModel.value,
                                  ),
                                )));
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
