# Chocolatey Packages

[![Build Status](https://dev.azure.com/dukesb11/Chocolatey-Packages/_apis/build/status/bdukes.Chocolatey-Packages)](https://dev.azure.com/dukesb11/Chocolatey-Packages/_build/latest?definitionId=1)
[![Update status](https://img.shields.io/badge/Gist-Update%20Status-informational?logo=github)](https://gist.github.com/bdukes/fd3d636b9b4617772f9b99ceb88838fa)
[![chocolatey/bdukes](https://img.shields.io/badge/Chocolatey-bdukes-blue?logo=chocolatey)](https://chocolatey.org/profiles/bdukes)

This contains Chocolatey packages, both manually and automatically maintained.

## Folder Structure

- `au` - The scripts for running Automatic Updater (AU) are here.
- `automatic` - where automatic packaging and packages are kept. These are packages that are automatically maintained using [AU](https://chocolatey.org/packages/au).
- `icons` - Where you keep icon files for the packages. This is done to reduce issues when packages themselves move around.
- `manual` - where packages that are not automatic are kept.

For setting up your own automatic package repository, please see [Automatic Packaging](https://chocolatey.org/docs/automatic-packages)

## Requirements

- Chocolatey (choco.exe)

### AU

- PowerShell v4+.
- The [AU module](https://chocolatey.org/packages/au).
