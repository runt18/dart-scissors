// Copyright 2015 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
library scissors.settings;

import 'package:barback/barback.dart';
import 'package:quiver/check.dart';

class ScissorsSettings {
  bool _isDebug;
  String _sasscPath;
  List<String> _sasscArgs;

  static const _DEFAULT_SASSC_PATH = 'sassc';
  static const _SASSC_PATH_PARAM = 'sasscPath';
  static const _SASSC_ARGS_PARAM = 'sasscArgs';
  static const _VALID_PARAMS = const [_SASSC_PATH_PARAM, _SASSC_ARGS_PARAM];

  ScissorsSettings.fromSettings(BarbackSettings settings) {
    this._isDebug = settings.mode == BarbackMode.DEBUG;
    var config = settings.configuration;
    this._sasscPath = config[_SASSC_PATH_PARAM] ?? _DEFAULT_SASSC_PATH;
    this._sasscArgs = config[_SASSC_ARGS_PARAM] ?? const<String>[];

    var invalidKeys = settings.configuration.keys
        .where((k) => !_VALID_PARAMS.contains(k));
    checkState(invalidKeys.isEmpty,
        message: () => "Invalid keys in configuration: $invalidKeys (valid keys: ${_VALID_PARAMS})");
  }

    bool get isDebug => _isDebug;
    String get sasscPath => _sasscPath;
    List<String> get sasscArgs => _sasscArgs;
}
