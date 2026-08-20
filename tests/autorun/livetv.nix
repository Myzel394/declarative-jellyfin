{pkgs ? import <nixpkgs> {}, ...}: let
  name = "livetv";
  config = "/var/lib/jellyfin/config/livetv.xml";
in {
  inherit name;
  test = pkgs.testers.nixosTest {
    inherit name;
    nodes = {
      machine = {pkgs, ...}: {
        imports = [
          ../../modules/default.nix
        ];
        environment.systemPackages = [pkgs.xmlstarlet];

        virtualisation.memorySize = 1024;

        services.declarative-jellyfin = {
          enable = true;
          livetv = {
            guideDays = 7;
            tunerHosts = [
              {
                id = "d87efc41254040f19a34be3940dda967";
                url = "https://api.init7.net/tvchannels.m3u";
                type = "m3u";
                allowHWTranscoding = false;
                allowStreamSharing = true;
                readAtNativeFramerate = true;
              }
            ];
            listingProviders = [
              {
                id = "e97efc41254040f19a34be3940dda968";
                type = "xmltv";
                path = "/data/guide.xml";
                channelMappings = [
                  {
                    name = "1";
                    value = "1.1";
                  }
                ];
              }
            ];
          };
        };
      };
    };

    testScript =
      # py
      ''
        import xml.etree.ElementTree as ET

        machine.wait_until_succeeds("test -e /var/lib/jellyfin/init-done", timeout=300)

        machine.succeed("xmlstarlet val '${config}'")

        with subtest("livetv.xml"):
          xml = machine.succeed("cat '${config}'")
          tree = ET.ElementTree(ET.fromstring(xml))
          root = tree.getroot()
          if root is None:
            raise TypeError

          with subtest("GuideDays"):
            for child in root:
              if child.tag == "GuideDays":
                if child.text == "7":
                  break
            else:
              assert False, "GuideDays not found or incorrect. Full XML: " + xml

          with subtest("TunerHosts"):
            for child in root:
              if child.tag == "TunerHosts":
                tunerHostInfo = child.find("TunerHostInfo")
                assert tunerHostInfo is not None, "No TunerHostInfo found. Full XML: " + xml
                type_ = tunerHostInfo.find("Type")
                url = tunerHostInfo.find("Url")
                assert type_ is not None and type_.text == "m3u"
                assert url is not None and url.text == "https://api.init7.net/tvchannels.m3u"
                break
            else:
              assert False, "TunerHosts not found. Full XML: " + xml

          with subtest("ListingProviders"):
            for child in root:
              if child.tag == "ListingProviders":
                listingsProviderInfo = child.find("ListingsProviderInfo")
                assert listingsProviderInfo is not None, "No ListingsProviderInfo found. Full XML: " + xml
                type_ = listingsProviderInfo.find("Type")
                assert type_ is not None and type_.text == "xmltv"
                channelMappings = listingsProviderInfo.find("ChannelMappings")
                assert channelMappings is not None, "No ChannelMappings found. Full XML: " + xml
                nameValuePair = channelMappings.find("NameValuePair")
                assert nameValuePair is not None, "No NameValuePair found. Full XML: " + xml
                name = nameValuePair.find("Name")
                value = nameValuePair.find("Value")
                assert name is not None and name.text == "1"
                assert value is not None and value.text == "1.1"
                break
            else:
              assert False, "ListingProviders not found. Full XML: " + xml
      '';
  };
}
