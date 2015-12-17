defmodule Telegrex.Type do
  @moduledoc """

  Module that implements all the types specified in the Telegram Bot API as
  elixir structs. All types used in the Bot API responses are represented as
  JSON objects.

  ## Available Types
    - `Telegrex.Type.User`
    - `Telegrex.Type.Chat`
    - `Telegrex.Type.Message`
    - `Telegrex.Type.PhotoSize`
    - `Telegrex.Type.Audio`
    - `Telegrex.Type.Document`
    - `Telegrex.Type.Sticker`
    - `Telegrex.Type.Video`
    - `Telegrex.Type.Voice`
    - `Telegrex.Type.Contact`
    - `Telegrex.Type.Location`
    - `Telegrex.Type.Update`
    - `Telegrex.Type.UserProfilePhotos`
    - `Telegrex.Type.ReplyKeyboardMarkup`
    - `Telegrex.Type.ReplyKeyboardHide`
    - `Telegrex.Type.ForceReply`
    - `Telegrex.Type.File`

  """

  defmodule User do
    defstruct id: nil, first_name: nil, last_name: nil, username: nil

    @typedoc """
    Represents a Telegram user or bot.

    Field      | Type    | Description
    ---------: | :-----: | -----------
    id	       | Integer | Unique identifier for this user or bot
    first_name | String	 | User's or bot's first name
    last_name  | String  | Optional. User's or bot's last name
    username   | String  | Optional. User's or bot's username

    """
    @type t :: %User{id: integer, first_name: binary, last_name: binary,
                     username: binary}
  end

  defmodule Chat do
    defstruct id: nil, type: nil, title: nil, username: nil, first_name: nil,
              last_name: nil

    @typedoc """
    Represents a chat.

    Field      | Type    | Description
    ---------: | :-----: | -----------
    id	       | Integer | Unique identifier for this user or bot
    type       | String  | Type of chat, can be either `private`, `group`, \
                           `supergroup` or `channel`
    first_name | String	 | User's or bot's first name
    last_name  | String  | Optional. User's or bot's last name
    username   | String  | Optional. User's or bot's username

    """
    @type t :: %Chat{id: integer, type: binary, title: binary, username: binary,
                     first_name: binary, last_name: binary}
  end

  defmodule Message do
    defstruct message_id: nil, from: nil, date: nil, chat: nil,
              forward_from: nil, forward_date: nil, reply_to_message: nil,
              text: nil, audio: nil, document: nil, photo: nil, sticker: nil,
              video: nil, voice: nil, caption: nil, contact: nil, location: nil,
              new_chat_participant: nil, left_chat_participant: nil,
              new_chat_title: nil, new_chat_photo: nil, delete_chat_photo: nil,
              group_chat_created: nil, supergroup_chat_created: nil,
              channel_chat_created: nil, migrate_to_chat_id: nil,
              migrate_from_chat_id: nil

    @typedoc """
    Represents a message.

    Field                    | Type                        | Description
    -----------------------: | :-------------------------: | -----------
    message_id               | Integer                     | Unique message identifier
    from                     | `Telegrex.Type.User`        | Optional. Sender, can \
                                                             be empty for messages \
                                                             sent to channels
    date                     | Integer                     | Date the message was \
                                                             sent in Unix time
    chat                     | `Telegrex.Type.Chat`        | Conversation the \
                                                             message belongs to
    forward_from	           | `Telegrex.Type.User`        | Optional. For forwarded \
                                                             messages, sender of the \
                                                             original message
    forward_date             | Integer                     | Optional. For forwarded \
                                                             messages, date the \
                                                             original message was \
                                                             sent in Unix time
    reply_to_message	       | Message                     | Optional. For replies, \
                                                             the original message. \
                                                             Note that the Message \
                                                             object in this field \
                                                             will not contain further \
                                                             reply_to_message fields \
                                                             even if it itself is a reply.
    text	                   | String	                     | Optional. For text messages, \
                                                             the actual UTF-8 text \
                                                             of the message
    audio	                   | Audio	                     | Optional. Message is \
                                                             an audio file, information \
                                                             about the file
    document	               | `Telegrex.Type.Document`	   | Optional. Message is a \
                                                             general file, information \
                                                             about the file
    photo	                   | [`Telegrex.Type.PhotoSize`] | Optional. Message is a \
                                                             photo, available sizes \
                                                             of the photo
    sticker	                 | `Telegrex.Type.Sticker`	   | Optional. Message is a \
                                                             sticker, information \
                                                             about the sticker
    video	                   | `Telegrex.Type.Video`	     | Optional. Message is a \
                                                             video, information \
                                                             about the video
    voice	                   | `Telegrex.Type.Voice`	     | Optional. Message is a \
                                                             voice message, information \
                                                             about the file
    caption	                 | String	                     | Optional. Caption for \
                                                             the photo or video
    contact	                 | `Telegrex.Type.Contact`	   | Optional. Message is a \
                                                             shared contact, information \
                                                             about the contact
    location	               | `Telegrex.Type.Location`	   | Optional. Message is a \
                                                             shared location, \
                                                             information about the location
    new_chat_participant     | `Telegrex.Type.User`	       | Optional. A new member \
                                                             was added to the group, \
                                                             information about them \
                                                             (this member may be the bot itself)
    left_chat_participant	   | `Telegrex.Type.User`	       | Optional. A member was \
                                                             removed from the group, \
                                                             information about them \
                                                             (this member may be the bot itself)
    new_chat_title	         | String	                     | Optional. A chat title \
                                                             was changed to this value
    new_chat_photo	         | [`Telegrex.Type.PhotoSize`] | Optional. A chat photo \
                                                             was change to this value
    delete_chat_photo	       | True	                       | Optional. Service message: \
                                                             the chat photo was deleted
    group_chat_created	     | True	                       | Optional. Service message: \
                                                             the group has been created
    supergroup_chat_created  | True	                       | Optional. Service message: \
                                                             the supergroup has been created
    channel_chat_created	   | True	                       | Optional. Service message: \
                                                             the channel has been created
    migrate_to_chat_id	     | Integer	                   | Optional. The group has \
                                                             been migrated to a \
                                                             supergroup with the \
                                                             specified identifier, \
                                                             not exceeding 1e13 by \
                                                             absolute value
    migrate_from_chat_id	   | Integer	                   | Optional. The supergroup \
                                                             has been migrated from a \
                                                             group with the specified \
                                                             identifier, not exceeding \
                                                             1e13 by absolute value

    """
    @type t :: %Message{message_id: integer, from: User.t, date: integer,
                        chat: Chat.t, forward_from: User.t, forward_date: integer,
                        reply_to_message: Message.t, text: binary, audio: Audio.t,
                        document: Document.t, photo: [PhotoSize.t],
                        sticker: Sticker.t, video: Video.t, voice: Voice.t,
                        caption: binary, contact: Contact.t, location: Location.t,
                        new_chat_participant: User.t, left_chat_participant: User.t,
                        new_chat_title: binary, new_chat_photo: [PhotoSize.t],
                        delete_chat_photo: true, group_chat_created: true,
                        supergroup_chat_created: true, channel_chat_created: true,
                        migrate_to_chat_id: integer, migrate_from_chat_id: integer}
  end

  defmodule PhotoSize do
    defstruct file_id: nil, width: nil, height: nil, file_size: nil

    @typedoc """
    Represents one size of a photo or a `Telegrex.Type.Document` /
    `Telegrex.Type.Sticker` thumbnail.

    Field      | Type    | Description
    ---------: | :-----: | -----------
    file_id	   | String  | Unique identifier for this file
    width      | Integer | Photo width
    height     | Integer | Photo height
    file_size	 | Integer | Optional. File size

    """
    @type t :: %PhotoSize{file_id: binary, width: integer, height: integer,
                          file_size: integer}
  end

  defmodule Audio do
    defstruct file_id: nil, duration: nil, performer: nil, title: nil,
              mime_type: nil, file_size: nil

    @typedoc """
    Represents an audio file to be treated as music by the Telegram clients.

    Field      | Type    | Description
    ---------: | :-----: | -----------
    file_id	   | String  | Unique identifier for this file
    duration	 | Integer | Duration of the audio in seconds as defined by sender
    performer	 | String	 | Optional. Performer of the audio as defined by \
                           sender or by audio tags
    title	     | String	 | Optional. Title of the audio as defined by \
                           sender or by audio tags
    mime_type	 | String	 | Optional. MIME type of the file as defined by sender
    file_size	 | Integer | Optional. File size

    """
    @type t :: %Audio{file_id: binary, duration: integer, performer: binary,
                      title: binary, mime_type: binary, file_size: integer}
  end

  defmodule Document do
    defstruct file_id: nil, thumb: nil, file_name: nil, mime_type: nil,
              file_size: nil

    @typedoc """
    Represents a general file (as opposed to `Telegrex.Type.PhotoSize`,
    `Telegrex.Type.Voice` and `Telegrex.Type.Audio`).

    Field      | Type                      | Description
    ---------: | :-----------------------: | -----------
    file_id	   | String                    | Unique file identifier
    thumb	     | `Telegrex.Type.PhotoSize` | Optional. Document thumbnail as \
                                             defined by sender
    file_name	 | String	                   | Optional. Original filename as \
                                             defined by sender
    mime_type  | String	                   | Optional. MIME type of the file \
                                             as defined by sender
    file_size	 | Integer                   | Optional. File size

    """
    @type t :: %Document{file_id: binary, thumb: PhotoSize.t, file_name: binary,
                         mime_type: binary, file_size: integer}

  end

  defmodule Sticker do
    defstruct file_id: nil, width: nil, height: nil, thumb: nil, file_size: nil

    @typedoc """
    Represents a sticker.

    Field      | Type                      | Description
    ---------: | :-----------------------: | -----------
    file_id	   | String                    | Unique identifier for this file
    width	     | Integer  	               | Sticker width
    height	   | Integer	                 | Sticker height
    thumb	     | `Telegrex.Type.PhotoSize` | Optional. Sticker thumbnail in \
                                             .webp or .jpg format
    file_size	 | Integer                   | Optional. File size

    """
    @type t :: %Sticker{file_id: binary, width: integer, height: integer,
                        thumb: PhotoSize.t, file_size: integer}
  end

  defmodule Video do
    defstruct file_id: nil, width: nil, height: nil, duration: nil, thumb: nil,
              mime_type: nil, file_size: nil

    @typedoc """
    Represents a video file.

    Field      | Type                      | Description
    ---------: | :-----------------------: | -----------
    file_id	   | String                    | Unique identifier for this file
    width	     | Integer  	               | Video width as defined by sender
    height	   | Integer	                 | Video height as defined by sender
    duration	 | Integer	                 | Duration of the video in seconds \
                                             as defined by sender
    thumb	     | `Telegrex.Type.PhotoSize` | Optional. Video thumbnail
    mime_type	 | String	                   | Optional. Mime type of a file as \
                                             defined by sender
    file_size	 | Integer                   | Optional. File size

    """
    @type t :: %Video{file_id: binary, width: integer, height: integer,
                      duration: integer, thumb: PhotoSize.t, mime_type: binary,
                      file_size: integer}

  end

  defmodule Voice do
    defstruct file_id: nil, duration: nil, mime_type: nil, file_size: nil

    @typedoc """
    Represents a voice note.

    Field      | Type    | Description
    ---------: | :-----: | -----------
    file_id	   | String  | Unique identifier for this file
    duration	 | Integer | Duration of the audio in seconds as defined by sender
    mime_type	 | String	 | Optional. Mime type of a file as defined by sender
    file_size	 | Integer | Optional. File size

    """
    @type t :: %Voice{file_id: binary, duration: integer, mime_type: binary,
                      file_size: integer}
  end

  defmodule Contact do
    defstruct phone_number: nil, first_name: nil, last_name: nil, user_id: nil

    @typedoc """
    Represents a phone contact.

    Field        | Type    | Description
    -----------: | :-----: | -----------
    phone_number | String	 | Contact's phone number
    first_name	 | String	 | Contact's first name
    last_name	   | String	 | Optional. Contact's last name
    user_id	     | Integer | Optional. Contact's user identifier in Telegram

    """
    @type t :: %Contact{phone_number: binary, first_name: binary,
                        last_name: binary, user_id: integer}
  end

  defmodule Location do
    defstruct longitude: nil, latitude: nil

    @typedoc """
    Represents a point on the map.

    Field     | Type   | Description
    --------: | :----: | -----------
    longitude | Float  | Contact's phone number
    latitude  | Float  | Contact's first name

    """
    @type t :: %Location{latitude: float, longitude: float}
  end

  defmodule Update do
    defstruct update_id: nil, message: nil

    @typedoc """
    Represents an incoming update.

    Field     | Type                    | Description
    --------: | :---------------------: | -----------
    update_id | Integer                 | The update‘s unique identifier. \
                                          Update identifiers start from a \
                                          certain positive number and increase \
                                          sequentially. This ID becomes \
                                          especially handy if you're using \
                                          (Webhooks)[https://core.telegram.org/bots/api#setwebhook], \
                                          since it allows you to ignore \
                                          repeated updates or to restore the \
                                          correct update sequence, should they \
                                          get out of order.
    message   | `Telegrex.Type.Message` | Optional. New incoming message of any \
                                          kind — text, photo, sticker, etc.

    """
    @type t :: %Update{update_id: integer, message: Message.t}
  end

  defmodule UserProfilePhotos do
    defstruct total_count: nil, photos: nil

    @typedoc """
    Represents a user's profile pictures.

    Field       | Type                        | Description
    ----------: | :-------------------------: | -----------
    total_count |	Integer	                    | Total number of profile pictures \
                                                the target user has
    photos	    | [`Telegrex.Type.PhotoSize`] | Requested profile pictures \
                                                (in up to 4 sizes each)

    """
    @type t :: %UserProfilePhotos{total_count: integer, photos: [PhotoSize.t]}
  end

  defmodule ReplyKeyboardMarkup do
    defstruct keyboard: nil, resize_keyboard: nil, one_time_keyboard: nil,
              selective: nil

    @typedoc """
    Represents a (custom keyboard)[https://core.telegram.org/bots#keyboards]
    with reply options.

    Field             | Type       | Description
    ----------------: | :--------: | -----------
    keyboard          |	[[String]] | Array of button rows, each represented by \
                                     an Array of Strings
    resize_keyboard	  | Boolean    | Optional. Requests clients to resize the \
                                     keyboard vertically for optimal fit \
                                     (e.g., make the keyboard smaller if there \
                                     are just two rows of buttons). Defaults to \
                                     false, in which case the custom keyboard \
                                     is always of the same height as the app's \
                                     standard keyboard.
    one_time_keyboard | Boolean    | Optional. Requests clients to hide the \
                                     keyboard as soon as it's been used. \
                                     Defaults to false.
    selective         | Boolean    | Optional. Use this parameter if you want \
                                     to show the keyboard to specific users \
                                     only. Targets: 1) users that are `@mentioned` \
                                     in the text of the Message object; 2) if \
                                     the bot's message is a reply (has \
                                     reply_to_message_id), sender of the original \
                                     message. \
                                     Example: A user requests to change \
                                     the bot‘s language, bot replies to the \
                                     request with a keyboard to select the new \
                                     language. Other users in the group don’t \
                                     see the keyboard.

    """
    @type t :: %ReplyKeyboardMarkup{keyboard: [[binary]], resize_keyboard: boolean,
                                    one_time_keyboard: boolean, selective: boolean}

  end

  defmodule ReplyKeyboardHide do
    defstruct hide_keyboard: nil, selective: nil

    @typedoc """
    Upon receiving a message with this object, Telegram clients will hide the
    current custom keyboard and display the default letter-keyboard. By default,
    custom keyboards are displayed until a new keyboard is sent by a bot. An
    exception is made for one-time keyboards that are hidden immediately after
    the user presses a button (see `Telegrex.Type.ReplyKeyboardMarkup`).

    Field         | Type    | Description
    ------------: | :-----: | -----------
    hide_keyboard |	True	  | Requests clients to hide the custom keyboard
    selective	    | Boolean | Optional. Use this parameter if you want to hide \
                              keyboard for specific users only. Targets: 1) \
                              users that are @mentioned in the text of the \
                              Message object; 2) if the bot's message is a \
                              reply (has reply_to_message_id), sender of the \
                              original message. \
                              Example: A user votes in a poll, \
                              bot returns confirmation message in reply to the \
                              vote and hides keyboard for that user, while still \
                              showing the keyboard with poll options to users \
                              who haven't voted yet.

    """
    @type t :: %ReplyKeyboardHide{hide_keyboard: true, selective: boolean}
  end

  defmodule ForceReply do
    defstruct force_reply: nil, selective: nil

    @typedoc """
    Upon receiving a message with this object, Telegram clients will display a
    reply interface to the user (act as if the user has selected the bot‘s
    message and tapped ’Reply'). This can be extremely useful if you want to
    create user-friendly step-by-step interfaces without having to sacrifice
    privacy mode.

    Field       | Type    | Description
    ----------: | :-----: | -----------
    force_reply |	True	  | Shows reply interface to the user, as if they \
                            manually selected the bot‘s message and tapped `Reply`
    selective	  | Boolean | Optional. Use this parameter if you want to force \
                            reply from specific users only. Targets: 1) users \
                            that are @mentioned in the text of the \
                            `Telegrex.Type.Message` object; 2) if the bot's \
                            message is a reply (has reply_to_message_id), sender \
                            of the original message.

    """
    @type t :: %ForceReply{force_reply: true, selective: boolean}

  end

  defmodule File do
    defstruct file_id: nil, file_size: nil, file_path: nil

    @typedoc """
    Represents a file ready to be downloaded. The file can be downloaded via the
    endpoint https://api.telegram.org/file/bot<token>/<file_path>. It is
    guaranteed that the link will be valid for at least 1 hour. When the link
    expires, a new one can be requested by calling `getFile`.

    > Maximum file size to download is 20 MB

    Field     | Type    | Description
    --------: | :-----: | -----------
    file_id   | String  | Unique identifier for this file
    file_size | Integer | Optional. File size, if known
    file_path | String  | Optional. File path. Use \
                          https://api.telegram.org/file/bot<token>/<file_path> \
                          to get the file.

    """
    @type t :: %File{file_id: binary, file_size: integer, file_path: binary}
  end

end
