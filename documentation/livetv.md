# livetv
## livetv.enableOriginalAudioWithEncodedRecordings
Whether to preserve the original audio track when recordings are encoded.

**Type**: boolean

**Default**: `false`

## livetv.enableRecordingSubfolders
Whether to organize recordings into subfolders (e.g. by series).

**Type**: boolean

**Default**: `false`

## livetv.guideDays
The number of days of program guide data to fetch for each channel.
Leave as `null` to let Jellyfin determine this automatically based on the number of channels/listing providers configured.


**Type**: null or (positive integer, meaning >0)

**Default**: `<null>`

## livetv.listingProviders
List of configured program guide/listing providers.

**Type**: list of (submodule)

**Default**: `[]`

## livetv.mediaLocationsCreated
List of recording locations that have been created. Managed by Jellyfin; you typically don't need to set this.

**Type**: list of string

**Default**: `[]`

## livetv.movieRecordingPath
Custom path to save movie recordings to. Leave empty to use `recordingPath`.

**Type**: string

**Default**: `""`

## livetv.postPaddingSeconds
Number of seconds to end recordings late.

**Type**: signed integer

**Default**: `0`

## livetv.prePaddingSeconds
Number of seconds to start recordings early.

**Type**: signed integer

**Default**: `0`

## livetv.recordingPath
Custom path to save recordings to. Leave empty to use the default location.

**Type**: string

**Default**: `""`

## livetv.recordingPostProcessor
Name of an executable to run after a recording finishes.

**Type**: string

**Default**: `""`

## livetv.recordingPostProcessorArguments
Arguments passed to the recording post-processor executable. `{path}` is replaced with the path of the recording.

**Type**: string

**Default**: `""{path}""`

## livetv.saveRecordingImages
Whether to save images alongside recordings.

**Type**: boolean

**Default**: `true`

## livetv.saveRecordingNFO
Whether to save an NFO file alongside recordings.

**Type**: boolean

**Default**: `true`

## livetv.seriesRecordingPath
Custom path to save series recordings to. Leave empty to use `recordingPath`.

**Type**: string

**Default**: `""`

## livetv.tunerHosts
List of configured TV tuner sources.

**Type**: list of (submodule)

**Default**: `[]`
