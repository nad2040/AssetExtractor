# AssetExtractor
Extract assets from minecraft

Requires java 17
Please open a terminal and do: `java -jar /path/to/AssetExtractor-uber.jar`

## What happens?

Opens last modified index in minecraft/assets/indexes to
find the hash for the file in the minecraft/assets/objects directory.

Uses Gson to deserialize the version.json index file.

Loops through the key name of each object using the search term from the user.
For every match, the name of the asset in the keyname gets converted into a relative directory next to the jar file.

Example of how to use:

type `music` or `fire` when prompted for a search term.
You can use a `/` to make sure the search term isn't a substring of a larger word,
like `fire` could be part of `fireworks`.

## Notice
This application does not distribute any minecraft assets for free!


