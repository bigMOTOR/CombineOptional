# CombineOptional

Combine extensions for Swift optionals types.
Inspired by [RxOptional](https://guides.cocoapods.org/using/using-cocoapods.html)
This extension allows you to filter nil values from the upstream and get unwraped type to work with.
I use it personaly for my own needs, but welcome to join if you need something like that. 🙃

## Getting Started

```swift
Publishers.Sequence<[Int?], Never>(sequence: [1, nil, 2])
      .filterNil()
      .sink(
        receiveCompletion: { _ in  },
        receiveValue: { print("\($0)") }
      )
```

You'll get the console output:
```
1
2
```

## Author

Nikolay Fiantsev   

-- https://www.linkedin.com/in/nikolayfnv/   
-- https://www.facebook.com/NikolayFiantsev

## Contributing

- Something wrong or you need anything else? Please open an issue or make a Pull Request.
- Pull requests are welcome.

## License

RxGallery is available under the MIT license. See the LICENSE file for more info.