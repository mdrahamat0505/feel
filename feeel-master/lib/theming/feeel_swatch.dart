// Copyright (C) 2019–2021 Miroslav Mazel
//
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

import 'dart:ui';

import 'package:feeel/theming/feeel_shade.dart';

class FeeelSwatch {
  final Map<FeeelShade, Color> _swatch;

  FeeelSwatch(
      {Color lightest,
      Color lighter,
      Color light,
      Color dark,
      Color darker,
      Color darkest})
      : _swatch = {
          FeeelShade.LIGHTEST: lightest,
          FeeelShade.LIGHTER: lighter,
          FeeelShade.LIGHT: light,
          FeeelShade.DARK: dark,
          FeeelShade.DARKER: darker,
          FeeelShade.DARKEST: darkest,
        };

  Color getColor(FeeelShade shade) => _swatch[shade];

  Color getColorByBrightness(FeeelShade shade, Brightness brightness) {
    if (brightness == Brightness.dark) {
      switch (shade) {
        case FeeelShade.LIGHTEST:
          shade = FeeelShade.DARKEST;
          break;
        case FeeelShade.LIGHTER:
          shade = FeeelShade.DARKER;
          break;
        case FeeelShade.LIGHT:
          shade = FeeelShade.DARK;
          break;
        case FeeelShade.DARK:
          shade = FeeelShade.LIGHT;
          break;
        case FeeelShade.DARKER:
          shade = FeeelShade.LIGHTER;
          break;
        case FeeelShade.DARKEST:
          shade = FeeelShade.LIGHTEST;
          break;
      }
    }

    return getColor(shade);
  }
}
