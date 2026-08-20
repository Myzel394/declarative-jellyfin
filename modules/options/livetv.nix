{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.services.declarative-jellyfin.livetv;

  nameValuePairOpts = {
    options = {
      name = mkOption {
        type = types.str;
        description = "The channel name/number as reported by the tuner/listing source.";
      };
      value = mkOption {
        type = types.str;
        description = "The channel number/name it should be mapped to.";
      };
    };
  };

  tunerHostOpts = {
    options = {
      id = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          A unique ID for this tuner host. Any unique string works, e.g. `"1"`.
          Leave as `null` to auto-generate one from this tuner host's position in the `tunerHosts` list (`"1"`, `"2"`, ...),
          or set your own, e.g. generated with `uuidgen -r | sed 's/-//g'`.
        '';
        example = "d87efc41254040f19a34be3940dda967";
      };
      type = mkOption {
        type = types.enum ["m3u" "hdhomerun"];
        description = ''
          The type of tuner source: `m3u` for an M3U playlist, or `hdhomerun` for an HDHomeRun device.
          These are the only two tuner types Jellyfin ships built in.
        '';
        example = "m3u";
      };
      url = mkOption {
        type = types.str;
        description = ''
          The URL/address of the tuner source. Mandatory for both the `m3u` and `hdhomerun` tuner types.
        '';
        example = "https://example.com/tvchannels.m3u";
      };
      deviceId = mkOption {
        type = types.str;
        default = "";
        description = "The device ID of the tuner. Used by e.g. the `hdhomerun` tuner type.";
      };
      friendlyName = mkOption {
        type = types.str;
        default = "";
        description = "A friendly name to identify this tuner by.";
      };
      importFavoritesOnly = mkOption {
        type = types.bool;
        default = false;
        description = "Only import channels marked as favorite from the tuner source.";
      };
      allowHWTranscoding = mkOption {
        type = types.bool;
        default = true;
        description = "Whether hardware transcoding is allowed for streams from this tuner.";
      };
      allowFmp4TranscodingContainer = mkOption {
        type = types.bool;
        default = false;
        description = "Whether the fMP4 container is allowed to be used when transcoding streams from this tuner.";
      };
      allowStreamSharing = mkOption {
        type = types.bool;
        default = true;
        description = "Whether a single stream from this tuner can be shared between multiple clients.";
      };
      fallbackMaxStreamingBitrate = mkOption {
        type = types.int;
        default = 30000000;
        description = "The maximum streaming bitrate to fall back to, in bits per second.";
      };
      enableStreamLooping = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to loop the stream. Used for e.g. the `m3u` tuner type.";
      };
      source = mkOption {
        type = types.str;
        default = "";
        description = "The source of the tuner.";
      };
      tunerCount = mkOption {
        type = types.int;
        default = 0;
        description = "The number of simultaneous streams this tuner supports. Set to 0 for unlimited.";
      };
      userAgent = mkOption {
        type = types.str;
        default = "";
        description = "A custom user agent to use when connecting to this tuner source.";
      };
      ignoreDts = mkOption {
        type = types.bool;
        default = true;
        description = "Whether to ignore DTS timestamps when remuxing/transcoding streams from this tuner.";
      };
      readAtNativeFramerate = mkOption {
        type = types.bool;
        default = false;
        description = "Whether to read the stream at its native framerate, rather than as fast as possible.";
      };
    };
  };

  listingProviderOpts = {
    options = {
      id = mkOption {
        type = with types; nullOr str;
        default = null;
        description = ''
          A unique ID for this listing provider. Any unique string works, e.g. `"1"`.
          Leave as `null` to auto-generate one from this provider's position in the `listingProviders` list (`"1"`, `"2"`, ...),
          or set your own, e.g. generated with `uuidgen -r | sed 's/-//g'`.
        '';
      };
      type = mkOption {
        type = types.enum ["SchedulesDirect" "xmltv"];
        description = ''
          The type of listing provider: `SchedulesDirect`, or `xmltv` for an XMLTV file/URL.
          These are the only two listing provider types Jellyfin ships built in.
        '';
        example = "xmltv";
      };
      username = mkOption {
        type = types.str;
        default = "";
        description = "Username for the listing provider. Mandatory when `type` is `SchedulesDirect`.";
      };
      password = mkOption {
        type = types.str;
        default = "";
        description = ''
          Password for the listing provider. Mandatory when `type` is `SchedulesDirect`.
          WARNING: This is stored in plain text
        '';
      };
      listingsId = mkOption {
        type = types.str;
        default = "";
        description = "The ID of the listings/lineup to use from the listing provider. Mandatory when `type` is `SchedulesDirect`.";
      };
      zipCode = mkOption {
        type = types.str;
        default = "";
        description = "The zip/postal code to use when looking up listings.";
      };
      country = mkOption {
        type = types.str;
        default = "";
        description = "The country to use when looking up listings.";
      };
      path = mkOption {
        type = types.str;
        default = "";
        description = "Path or URL to the listings source. Mandatory when `type` is `xmltv`.";
      };
      enabledTuners = mkOption {
        type = with types; listOf str;
        default = [];
        description = "List of tuner host IDs that this listing provider applies to. If empty and `enableAllTuners` is false, it applies to none.";
      };
      enableAllTuners = mkOption {
        type = types.bool;
        default = true;
        description = "Whether this listing provider applies to all configured tuner hosts.";
      };
      newsCategories = mkOption {
        type = with types; listOf str;
        default = ["news" "journalism" "documentary" "current affairs"];
        description = "Category names used to identify news programs.";
      };
      sportsCategories = mkOption {
        type = with types; listOf str;
        default = ["sports" "basketball" "baseball" "football"];
        description = "Category names used to identify sports programs.";
      };
      kidsCategories = mkOption {
        type = with types; listOf str;
        default = ["kids" "family" "children" "childrens" "disney"];
        description = "Category names used to identify kids programs.";
      };
      movieCategories = mkOption {
        type = with types; listOf str;
        default = ["movie"];
        description = "Category names used to identify movies.";
      };
      channelMappings = mkOption {
        type = with types; listOf (submodule nameValuePairOpts);
        default = [];
        description = "Maps channel numbers/names as reported by the listing provider to the channel numbers/names used by the tuner(s).";
        example = [
          {
            name = "1";
            value = "1.1";
          }
        ];
      };
      moviePrefix = mkOption {
        type = types.str;
        default = "";
        description = "A prefix used to identify movie programs by title.";
      };
      preferredLanguage = mkOption {
        type = types.str;
        default = "";
        description = "The preferred language to use for programs, if available.";
      };
      userAgent = mkOption {
        type = types.str;
        default = "";
        description = "A custom user agent to use when connecting to this listing provider.";
      };
    };
  };
in {
  options.services.declarative-jellyfin.livetv = {
    guideDays = mkOption {
      type = with types; nullOr ints.positive;
      default = null;
      description = ''
        The number of days of program guide data to fetch for each channel.
        Leave as `null` to let Jellyfin determine this automatically based on the number of channels/listing providers configured.
      '';
    };
    recordingPath = mkOption {
      type = types.str;
      default = "";
      description = "Custom path to save recordings to. Leave empty to use the default location.";
    };
    movieRecordingPath = mkOption {
      type = types.str;
      default = "";
      description = "Custom path to save movie recordings to. Leave empty to use `recordingPath`.";
    };
    seriesRecordingPath = mkOption {
      type = types.str;
      default = "";
      description = "Custom path to save series recordings to. Leave empty to use `recordingPath`.";
    };
    enableRecordingSubfolders = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to organize recordings into subfolders (e.g. by series).";
    };
    enableOriginalAudioWithEncodedRecordings = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to preserve the original audio track when recordings are encoded.";
    };
    tunerHosts = mkOption {
      type = with types; listOf (submodule tunerHostOpts);
      default = [];
      description = "List of configured TV tuner sources.";
      example = [
        {
          id = "d87efc41254040f19a34be3940dda967";
          type = "m3u";
          url = "https://api.init7.net/tvchannels.m3u";
        }
      ];
    };
    listingProviders = mkOption {
      type = with types; listOf (submodule listingProviderOpts);
      default = [];
      description = "List of configured program guide/listing providers.";
    };
    prePaddingSeconds = mkOption {
      type = types.int;
      default = 0;
      description = "Number of seconds to start recordings early.";
    };
    postPaddingSeconds = mkOption {
      type = types.int;
      default = 0;
      description = "Number of seconds to end recordings late.";
    };
    mediaLocationsCreated = mkOption {
      type = with types; listOf str;
      default = [];
      description = "List of recording locations that have been created. Managed by Jellyfin; you typically don't need to set this.";
    };
    recordingPostProcessor = mkOption {
      type = types.str;
      default = "";
      description = "Name of an executable to run after a recording finishes.";
    };
    recordingPostProcessorArguments = mkOption {
      type = types.str;
      default = ''"{path}"'';
      description = "Arguments passed to the recording post-processor executable. `{path}` is replaced with the path of the recording.";
    };
    saveRecordingNFO = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to save an NFO file alongside recordings.";
    };
    saveRecordingImages = mkOption {
      type = types.bool;
      default = true;
      description = "Whether to save images alongside recordings.";
    };
  };

  config.assertions =
    imap1 (
      index: lp: {
        assertion = lp.type != "xmltv" || lp.path != "";
        message = "services.declarative-jellyfin.livetv.listingProviders.${toString index}.path is mandatory when type is \"xmltv\".";
      }
    )
    cfg.listingProviders
    ++ imap1 (
      index: lp: {
        assertion = lp.type != "SchedulesDirect" || (lp.username != "" && lp.password != "" && lp.listingsId != "");
        message = "services.declarative-jellyfin.livetv.listingProviders.${toString index}.username, .password and .listingsId are mandatory when type is \"SchedulesDirect\".";
      }
    )
    cfg.listingProviders;
}
