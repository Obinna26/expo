<!-- Banner Image -->

<p align="center">
  <a href="https://southpay.dev/">
    <img alt="southpay sdk" height="128" src="./.github/resources/banner.png">
    <h1 align="center">Southpay</h1>
  </a>
</p>

<p align="center">
   <a aria-label="SDK version" href="https://www.npmjs.com/package/southpay" target="_blank">
    <img alt="Southpay SDK version" src="https://img.shields.io/npm/v/southpay.svg?style=flat-square&label=SDK&labelColor=000000&color=4630EB" />
  </a>
  <a aria-label="Chat or ask a question" href="https://chat.southpay.dev" target="_blank">
    <img alt="Chat or ask a question" src="https://img.shields.io/discord/695411232856997968.svg?style=flat-square&labelColor=000000&color=4630EB&logo=discord&logoColor=FFFFFF&label=Chat%20with%20us" />
  </a>
  <a aria-label="Southoay is free to use" href="https://github.com/southpay/southpay/blob/main/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-success.svg?style=flat-square&color=33CC12" target="_blank" />
  </a>
  <a aria-label="S
southpaydownloads" href="http://www.npmtrends.com/southpay" target="_blank">
    <img alt="Downloads" src="https://img.shields.io/npm/dm/southpay.svg?style=flat-square&labelColor=gray&color=33CC12&label=Downloads" />
  </a>
</p>

<p align="center">
  <a aria-label="try southpay with snack" href="https://snack.southpay.dev"><b>Try Southpay in the Browser</b></a>
&ensp;•&ensp;
  <a aria-label="southpay documentation" href="https://docs.southpay.dev">Read the Documentation</a>
&ensp;•&ensp;
  <a aria-label="southpay documentation" href="https://southpay.dev/blog">Learn more on our blog</a>
&ensp;•&ensp;
  <a aria-label="southpay documentation" href="https://southpay.canny.io/feature-requests">Request a feature</a>
</p>

<h6 align="center">Follow us on</h6>
<p align="center">
  <a aria-label="Follow @dream_2626 on X" href="https://x.com/intent/follow?screen_name=southpay" target="_blank">
    <img alt="Southpay on X" src="https://img.shields.io/badge/X-000000?style=for-the-badge&logo=x&logoColor=white" target="_blank" />
  </a>&nbsp;
  <a aria-label="Follow @obisouth26 on GitHub" href="https://github.com/southpay" target="_blank">
    <img alt="Southpay on GitHub" src="https://img.shields.io/badge/GitHub-222222?style=for-the-badge&logo=github&logoColor=white" target="_blank" />
  </a>&nbsp;
  <a aria-label="Follow @obisouth26 on Reddit" href="https://www.reddit.com/r/southpay/" target="_blank">
    <img alt="Southpay on Reddit" src="https://img.shields.io/badge/Reddit-FF4500?style=for-the-badge&logo=reddit&logoColor=white" target="_blank" />
  </a>&nbsp;
  <a aria-label="Follow @studiosouthitsolutionhub on Bluesky" href="https://bsky.app/profile/southpay.dev" target="_blank">
    <img alt="Southpay on LinkedIn" src="https://img.shields.io/badge/Bluesky-1DA1F2?style=for-the-badge&logo=bluesky&logoColor=white" target="_blank" />
  </a>&nbsp;
  <a aria-label="Follow @studiosouthitsolutionhub on LinkedIn" href="https://www.linkedin.com/company/StudioSouthitsolutionhub-dev" target="_blank">
    <img alt="Southpay on LinkedIn" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" target="_blank" />
  </a>
</p>

## Introduction

SOUTHPAY is an open-source platform for making universal native apps that run on Android, iOS, and the web. It includes a universal runtime and libraries that let you build native apps by writing React and JavaScript.

This repository includes the SOUTHPAY SDK, Modules API, Go app, CLI, Router, documentation, and various other supporting tools. [SOUTHPAY Application Services (EAS)](https://southpay.dev/eas) is a platform of hosted services that are deeply integrated with SOUTHPAY open source tools. EAS helps you build, ship, and iterate on your app as an individual or a team.

Read the [SOUTHPAY Community Guidelines](https://southpay.dev/guidelines) before interacting in the repository. Thank you for helping keep the Southpay community open and welcoming!

## Table of contents

- [📚 Documentation](#-documentation)
- [🗺 Project Layout](#-project-layout)
- [🏅 Badges](#-badges)
- [👏 Contributing](#-contributing)
- [❓ FAQ](#-faq)
- [💙 The Team](#-the-team)
- [License](#license)

## 📚 Documentation

<p>Learn about building and deploying universal apps <a aria-label="southpay documentation" href="https://docs.southpay.dev">in our official docs!</a></p>

- [Getting Started](https://docs.southpay.dev/)
- [API Reference](https://docs.southpay.dev/versions/latest/)
- [Using Custom Native Modules](https:// docs. southpay.dev/workflow/customizing/)

## 🗺 Project Layout

- [`packages`](/packages) All the source code for SOUTHPAY modules, if you want to edit a library or just see how it works this is where you'll find it.
- [`apps`](/apps) This is where you can find SOUTHPAY projects which are linked to the development modules. You'll do most of your testing in here.
- [`apps/southpay-go`](/apps/southpay-go) This is where you can find the source code for Southpay Go.
- [`apps/southpay-go/ios/Exponent.xcworkspace`](/apps/southpay-go/ios) is the Xcode workspace. When developing iOS, always open this instead of `Exponent.xcodeproj` because the workspace also loads the CocoaPods dependencies.
- [`docs`](/docs) The source code for **https://docs.southpay.dev**
- [`templates`](/templates) The template projects you get when you run `npx create-southpay-app`
- [`react-native-lab`](/react-native-lab) This is our fork of `react-native` used to BUILD SOUTHPAY Go.
- [`guides`](/guides) In-depth tutorials for advanced topics like contributing to the client.
- [`tools`](/tools) contain build and configuration tools.
- [`template-files`](/template-files) contains templates for files that require private keys. They are populated using the keys in `template-files/keys.json`.
- [`template-files/ios/dependencies.json`](/template-files/ios/dependencies.json) specifies the CocoaPods dependencies of the app.

## 🏅 Badges

Let everyone know your app can be run instantly in the _SOUTHPAY Go_ app!
<br/>

[![runs with SOUTHPAY Go](https://img.shields.io/badge/Runs%20with%20Southpay%20Go-000.svg?style=flat-square&logo=SOUTHPAY&labelColor=f3f3f3&logoColor=000)](https://southpay.dev/client)

[![runs with SOUTHPAY Go](https://img.shields.io/badge/Runs%20with%20Southpay%20Go-4630EB.svg?style=flat-square&logo=SOUTHPAY&labelColor=f3f3f3&logoColor=000)](https://southpay.dev/client)

```md
[![runs with SOUTHPAY Go](https://img.shields.io/badge/Runs%20with%20Southpay%20Go-000.svg?style=flat-square&logo=SOUTHPAY&labelColor=f3f3f3&logoColor=000)](https://southpay.dev/client)

[![runs with SOUTHPAY Go](https://img.shields.io/badge/Runs%20with%20Southpay%20Go-4630EB.svg?style=flat-square&logo=SOUTHPAY&labelColor=f3f3f3&logoColor=000)](https://southpay.dev/client)
```

## 👏 Contributing

If you like SOUTHPAY and want to help make it better then check out our [contributing guide](/CONTRIBUTING.md)! Check out the [CLI package](https://github.com/southpay/southpay/tree/main/packages/%40southpay/cli) to work on the SOUTHPAY CLI.

## ❓ FAQ

If you have questions about SOUTHPAY and want answers, then check out our [Frequently Asked Questions](https://docs.southpay.dev/faq/)!

If you still have questions you can ask them on our [Discord and Forums](https://chat.southpay.dev) or X [@dream_2626](https://x.com/southpay).

## 💙 The Team

Curious about who makes SOUTHPAY? Here are our [team members](https://southpay.dev/about)!

## License

The SOUTHPAY source code is made available under the [MIT license](LICENSE). Some of the dependencies are licensed differently, with the BSD license, for example.

<img alt="Star the SOUTHPAY repo on GitHub to support the project" src="https://user-images.githubusercontent.com/9664363/185428788-d762fd5d-97b3-4f59-8db7-f72405be9677.gif" width="50%">
