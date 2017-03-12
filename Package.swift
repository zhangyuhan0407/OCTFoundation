import PackageDescription

let package = Package(
    name: "OCT+Foundation",
    dependencies: [
        .Package(url: "https://github.com/zhangyuhan0407/OCTJSON", versions: Version(0,0,0)..<Version(10,0,0))
    ]
)
