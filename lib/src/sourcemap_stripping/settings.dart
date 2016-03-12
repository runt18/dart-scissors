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
part of scissors.src.sourcemap_stripping.transformer;

abstract class SourcemapStrippingSettings {
  Setting<bool> get verbose;

  /// Disabled in general transformer groups.
  final stripSourcemaps = makeBoolSetting('stripSourcemaps', false);
}

class _SourcemapStrippingSettings extends SettingsBase
    with SourcemapStrippingSettings {
  _SourcemapStrippingSettings(settings) : super(settings);

  /// Enabled by default in release in standalone transformer.
  @override
  final stripSourcemaps = makeOptimSetting('stripSourcemaps');
}
