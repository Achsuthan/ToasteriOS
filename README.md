# ToasteriOS
Fully customized and lightweight toaster message for iOS. This plugin is easy to use in swift code and with one line of code we can trigger the toaster message.

## Screenshots

| Options | Tittle only | Tittle with custom style 
| ------ | ------ | ------|
| ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/tableList.png?raw=true) | ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/TitleOnly.png?raw=true)| ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/TitleWithStyle.png?raw=true) 

| Tittle and Message | Tittle and Message with custom style | Custom toaster background
| ------ | ------ | ------ |
| ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/TitleAndMessage.png?raw=true) | ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/TittleAndMessageWithCustomStyle.png?raw=true) | ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/CustomBackground.png?raw=true) 

 | Toaster on Top| Toaster on middle | Toaster on bottom 
 | ------ | ------| ------|
| ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/ToasterOnTop.png?raw=true)| ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/ToasterOnMiddle.png?raw=true) | ![Alt text](https://github.com/Achsuthan/ToasteriOS/blob/main/screenshots/ToasterOnBottom.png?raw=true)  

## Setup Instructions
# [Cocoapods](https://cocoapods.org)

To integrate Toast-Swift into your Xcode project using CocoaPods, specify it in your ``` Podfile  ```:
``` sh
pod 'ToasteriOS'
```
and in your code add  ``` import ToasteriOS  ```.

## Basic Examples
Basic example of how to use the ToasteriOS

```swift

//Basic usage
self.showToaster(title: "Success", message: "Hello World!")

//With some aditional parameter to customize the toaster message possition
self.showToaster(title: "Success", message: "Hello World!", position: .middle)
```

## Few More aditional customization

If you want to make more customize the style of title, message and toster background view here are some steps for to do.

```swift
//Custom style message
var titleStyle = ToasterMessageStyle()
titleStyle.font = UIFont.systemFont(ofSize: 18, weight: .bold) //Custom Font by default font is swift default font
titleStyle.textAlignment = .left //Alignment of the text possition by default the possition is left
titleStyle.textColor = .green //Custom colour for the text by default colour is green
            
var messageStyle = ToasterMessageStyle()
messageStyle.font = UIFont.systemFont(ofSize: 14, weight: .regular) //Custom Font by default font is swift default font
messageStyle.textAlignment = .left //Alignment of the text possition by default the possition is left
messageStyle.textColor = .white //Custom colour for the text by default colour is white

//Custom style for the toaster background
var backgroundStyle = ToasterBackgroundStyle()
backgroundStyle.backgroundColor = .black //Custom background color for the toaster by default the black color 
backgroundStyle.cornerRadius = 5 //Set the corner radius value for the background by default value is 8
backgroundStyle.delay = 6

//Can show the toaster message with above custom style 
self.showToaster(title: "success", message: "Hello World!", position: .top, titleStyle: titleStyle, messageStyle: messageStyle, toasterBacgroundStyle: backgroundStyle)
```

## Compatibility
- Version 5.x.x requires Swift 5 and Xcode 10.2 (or newer versions of Xcode).
- Version 4.x.x requires Swift 4.2 and Xcode 10.

## MIT License
```txt
Copyright (c) 2020 Achsuthan Mahendran.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```