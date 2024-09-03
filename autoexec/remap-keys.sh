#!/bin/bash

#
# https://gist.github.com/bennlee/0f5bc8dc15a53b2cc1c81cd92363bf18?permalink_comment_id=4791480
#

# remap caps-lock to F12
hidutil property --set '{"UserKeyMapping":[
  {
    "HIDKeyboardModifierMappingSrc": 0x700000039,
    "HIDKeyboardModifierMappingDst": 0x700000043
  }
]}'
