# react-native-autografo

![React Native Autografo](resources/autografo.gif)

[![npm version](https://badge.fury.io/js/react-native-autografo.svg)](https://www.npmjs.com/package/react-native-autografo)
[![Swift Version](https://img.shields.io/badge/Swift-4.0.x-orange.svg)](https://swift.org)

[![downloads](https://img.shields.io/npm/dw/react-native-autografo.svg)](https://www.npmjs.com/package/react-native-autografo)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/nuremx/react-native-autografo/pulls)

> iOS only

React Native component to obtain user signature on a png image, saved to device storage or returned in base64

## Installation

```bash
yarn add react-native-autografo
```

Link module

```bash
react-native link react-native-autografo
```

### iOS Notes

**Important**. Since this module uses Swift and RN projects are based in Obj-C, you will need to <ins>add an empty Swift file</ins> to make this module work. See related [Stack Overflow Post](https://stackoverflow.com/questions/50096025/it-gives-errors-when-using-swift-static-library-with-objective-c-project)

## Usage

```jsx
class MyComponent extends Component {
  handleSave = ({ url, base64 }) => {
    // Depending how save is called, will return url or base 64
    console.log({ url, base64 })
  }

  handleReset = () => {
    console.log('Signature has been reset')
  }

  render() {
    return (
      <Autografo
        stroke={{ color: '#000000' }}
        onSave={this.handleSave}
        onReset={this.handleReset}
        fileName="signature"
      >
        {(save, reset) => (
          {/* This will be the controls showed at the top of the view */}
          <View
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              flexDirection: 'row',
            }}
          >
            <Button title="Save" onPress={() => save()} />
            <Button title="Reset" onPress={() => reset()} />
          </View>
        )}
      </Autografo>
    )
  }
}
```

### Props

| Name       | Value                                | Description                                                                                                           |
| ---------- | ------------------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| `stroke`   | `{ color: String }` _optional_       | Properties for signature's stroke, TODO support stroke width                                                          |
| `onSave`   | `({ url, base64 }) => {}` _optional_ | Gets called when `save` has triggered and image is ready, will return `url` or `base64` depending on `save` arguments |
| `fileName` | `String` _optional_                  | Alternative to `save({ fileName: String })` will make to return a url path                                            |
| `children` | `Function` _optional_                | Function receiving `save` and `reset` parameters to be called                                                         |

### Methods

| Name    | Parameters                              | Description                                                                                                                                                                        |
| ------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `save`  | `{ asFile: Boolean, fileName: String }` | When called, and nor parameter is given the component will return a base64 encoded png image, if asFile is provided as true will return url path for png image at device's storage |
| `reset` | None                                    | Will reset the signature's view                                                                                                                                                    |

## Todo

- [ ] Android version

## License

Based on awersome project [**Uber Signature**](https://github.com/uber/UberSignature)

MIT - LICENSE
