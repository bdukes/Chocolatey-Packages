# Chocolatey Packages

[![Build status](https://ci.appveyor.com/api/projects/status/o9qbm2t3vwhqlugc?svg=true)](https://ci.appveyor.com/project/bdukes/chocolatey-packages)
[![Update status](https://img.shields.io/badge/AU-Status-lightgrey.svg)](https://gist.github.com/bdukes/fd3d636b9b4617772f9b99ceb88838fa)

This contains Chocolatey packages, both manually and automatically maintained.

### Folder Structure

* `au` - The scripts for running Automatic Updater (AU) are here.
* `automatic` - where automatic packaging and packages are kept. These are packages that are automatically maintained using either [AU](https://chocolatey.org/packages/au) or [Ketarin](https://chocolatey.org/packages/ketarin)/[ChocolateyPackageUpdater](https://chocolatey.org/packages/chocolateypackageupdater) combo.
* `icons` - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* `manual` - where packages that are not automatic are kept.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

### Requirements

* Chocolatey (choco.exe)

#### AU

* PowerShell v4+.
* The [AU module](https://chocolatey.org/packages/au).
