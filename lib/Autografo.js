import {
  requireNativeComponent,
  findNodeHandle,
  UIManager,
  View
} from 'react-native'

import React from 'react'
import PropTypes from 'prop-types'

const COMPONENT_NAME = 'AutografoView'
const RNAutografo = requireNativeComponent(COMPONENT_NAME)

function Autografo(props) {
  return (
    <View
      style={{
        flex: 1,
        width: '100%',
        height: '100%',
        position: 'relative',
      }}
    >
      <View style={{ position: 'absolute', top: 0, left: 0, right: 0 }}>
        {props.children(
          ({ asFile = false, fileName }) => {
            const name =
              fileName || props.fileName || (asFile ? 'signature' : '')

            UIManager.dispatchViewManagerCommand(
              findNodeHandle(this.node),
              UIManager[COMPONENT_NAME].Commands.save,
              [name]
            )
          },
          () =>
            UIManager.dispatchViewManagerCommand(
              findNodeHandle(this.node),
              UIManager[COMPONENT_NAME].Commands.reset
            )
        )}
      </View>
      <RNAutografo
        ref={(node) => (this.node = node)}
        style={{ flex: 1 }}
        onSave={(event) => {
          if (event.nativeEvent.base64) {
            props.onSave({ base64: event.nativeEvent.base64 })
          } else if (event.nativeEvent.url) {
            props.onSave({ url: event.nativeEvent.url })
          } else {
            props.onSave({ error: event.nativeEvent.error })
          }
        }}
        strokeWidth={props.stroke && props.stroke.width}
        strokeColor={props.stroke && props.stroke.color}
      />
    </View>
  )
}

Autografo.propTypes = {
  children: PropTypes.func,
  fileName: PropTypes.string,
  onSave: PropTypes.func,
}

export default Autografo
