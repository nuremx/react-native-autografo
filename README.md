# react-native-autografo

![React Native Autografo](resources/autografo.gif)

[![npm version](https://img.shields.io/npm/v/react-native-autografo.svg)](https://img.shields.io/npm/v/react-native-autografo.svg)
[![Swift Version](https://img.shields.io/badge/Swift-4.0.x-orange.svg)](https://swift.org)

[![downloads](https://img.shields.io/npm/dw/react-native-autografo.svg)](https://img.shields.io/npm/dw/react-native-autografo.svg)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

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

**Important**. Since this module uses Swift, and RN projects are based in Obj-C, <ins>add an empty Swift file</ins>. See related [Stack Overflow Post](https://stackoverflow.com/questions/50096025/it-gives-errors-when-using-swift-static-library-with-objective-c-project)

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
        hiddenButtons
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

## Todo

- [ ] Android version

## License

Based on awersome project [**Uber Signature**](https://github.com/uber/UberSignature)

MIT - LICENSE
