# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START functions_typed_googlechatbot]
require "functions_framework"

FunctionsFramework.typed "chat" do |req|
  displayName = req[:message][:sender][:displayName]
  imageUrl = req[:message][:sender][:avatarUrl]

  cardHeader = {
    title: "Hello #{displayName}!"
  }

  avatarWidget = {
    textParagraph: { text: "Your avatar picture: " }
  }

  avatarImageWidget = {
    image: {
      imageUrl: imageUrl
    }
  }

  avatarSection = {
    widgets: [avatarWidget, avatarImageWidget]
  }

  return {
    cardsV2: [
      {
        cardId: "avatarCard",
        card: {
          name: "Avatar Card",
          header: cardHeader,
          sections: [avatarSection]
        }
      }
    ]
  }
end
# [END functions_typed_googlechatbot]
