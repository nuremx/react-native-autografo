# react-native-autografo

[![npm version](https://img.shields.io/npm/v/:packageName.svg)](https://img.shields.io/npm/v/:packageName.svg)
[![Swift Version](https://img.shields.io/badge/Swift-4.0.x-orange.svg)](https://swift.org)

[![downloads](https://img.shields.io/npm/dw/:packageName.svg)](https://img.shields.io/npm/dw/:packageName.svg)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

> iOS only

## Installation

```bash
yarn add react-native-autografo # or npm i
```

Link module

```bash
react-native link react-native-autografo
```

### iOS Notes

**Important**. Since this module uses Swift, and RN projects are based in Obj-C, <ins>add an empty Swift file</ins>. See related [Stack Overflow Post](https://stackoverflow.com/questions/50096025/it-gives-errors-when-using-swift-static-library-with-objective-c-project)

## Usage

```javascript
<Autografo
  stroke={{ color: '#000000' }}
  onSave={this.handleSave}
  onReset={this.handleReset}
  fileName="signature"
  hiddenButtons
>
  {(save, reset) => (
    <View
      style={{
        display: 'flex',
        justifyContent: 'space-between',
        flexDirection: 'row',
      }}
    >
      <Button
        title="Save"
        onPress={() => save() })}
      />
      <Button title="Reset" onPress={() => reset()} />
    </View>
  )}
</Autografo>
```

## Todo

- [ ] Android version

## License

MIT - LICENSE
