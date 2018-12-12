# Chocolatey Packages

[![Build Status](https://dev.azure.com/dukesb11/Chocolatey-Packages/_apis/build/status/bdukes.Chocolatey-Packages)](https://dev.azure.com/dukesb11/Chocolatey-Packages/_build/latest?definitionId=1)

This contains Chocolatey packages, both manually and automatically maintained.

### Folder Structure

* `au` - The scripts for running Automatic Updater (AU) are here.
* `automatic` - where automatic packaging and packages are kept. These are packages that are automatically maintained using [AU](https://chocolatey.org/packages/au).
* `icons` - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
* `manual` - where packages that are not automatic are kept.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

### Requirements

* Chocolatey (choco.exe)

#### AU

* PowerShell v4+.
* The [AU module](https://chocolatey.org/packages/au).
