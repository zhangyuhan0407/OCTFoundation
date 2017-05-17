import PackageDescription

let package = Package(
    name: "OCTFoundation",
    dependencies: [
//        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/zhangyuhan0407/OCTJSON", versions: Version(0,0,0)..<Version(10,0,0))
    ]
)
