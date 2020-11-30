# TWRP Device configuration for Motorola Edge

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (1x2.4 GHz Kryo 475 Prime & 1x2.2 GHz Kryo 475 Gold & 6x1.8 GHz Kryo 475 Silver)
CHIPSET | Qualcomm SM7250 Snapdragon 765G
GPU     | Adreno 620
Memory  | 4 / 6GB
Shipped Android Version | 10
Storage | 128GB
Battery | 4500 mAh
Dimensions | 161.6 x 71.1 x 9.3 mm
Display | 1080 x 2340 pixels, 6.7" OLED, 90Hz, HDR10
Rear Camera  | 64 MP (f/1.8) + 8 MP (f/2.4) + 16 MP (f/2.2)
Front Camera | 25 MP (f/2.0)

![Device Picture](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-edge-midnight-magenta-1.jpg)

### Kernel Source

See /prebuilt/README.md

### How to compile

```sh
. build/envsetup.sh
export LC_ALL=C
lunch omni_racer-eng
make -j4 recoveryimage
```

### Build with TWRP installer

To automatically make the twrp installer, you need to import this commit in the build/make path:
```sh
https://gerrit.omnirom.org/#/c/android_build/+/33182/
```

Then add @osm0sis' standard twrp_abtemplate repo to a local manifest as indicated below (followed by another `repo sync` to download the repo):
```xml
<project name="osm0sis/twrp_abtemplate" path="bootable/recovery/installer" remote="github" revision="master"/>
```

### Copyright
 ```
  /*
  *  Copyright (C) 2013-21 The OmniROM Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
