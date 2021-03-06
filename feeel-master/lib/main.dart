// Copyright (C) 2019–2021 Miroslav Mazel

//  Best Workout at Home choise add exercise

// This file is part of Feeel.
//
// Feeel is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version. As an additional permission under
// section 7, you are allowed to distribute the software through an app
// store, even if that store has restrictive terms and conditions that
// are incompatible with the AGPL, provided that the source is also
// available under the AGPL with or without this permission through a
// channel without those restrictive terms and conditions.
//
// Feeel is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with Feeel.  If not, see <http://www.gnu.org/licenses/>.

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:feeel/audio/tts_helper.dart';
import 'package:feeel/screens/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'db/notification_helper.dart';
import 'theming/feeel_themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => _onWidgetBuilt(context));

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));

    return AdaptiveTheme(
        light: FeeelThemes.lightTheme,
        dark: FeeelThemes.darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Feel',
            theme: theme,
            darkTheme: darkTheme,
            supportedLocales: [
              const Locale('en'),
              const Locale('cs'),
              const Locale('de'),
              const Locale('es'),
              const Locale('eu'),
              const Locale('fr'),
              const Locale('id'),
              const Locale('it'),
              const Locale('nl'),
              const Locale('pt'),
              const Locale('ru'),
              const Locale('tr'),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: I18n(
                child: WorkoutListScreen()))); //todo not seeing current locale!
  }

  void _onWidgetBuilt(BuildContext context) {
    TTSHelper.tts.init(context);
    NotificationHelper.helper.init(context);
  }
}
