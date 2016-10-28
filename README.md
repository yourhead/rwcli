# CLI


## A Command Line publisher for RapidWeaver.



### Description

CLI is a plugin for RapidWeaver that adds a very basic publsihing a file from the command line.  The goal is to produce a repeatable mechanism for automating publishing for integration testing.

### Use
 - compile and install the cli plugin
 - set up a RapidWeaver project  (one is provided in this project as an example)
- make sure to specify the publish location -- this cannot be specified on the command line :-(
 - launch RW from the command line

```

% /Applications/RapidWeaver\ 7.app <file to publish> --publish all

```

### Use in a script
You can automate publishing in a script.  An example script is provided.


### Warning

This plugin uses several private mechanism in order run the publish. You should not use fragile private methods like these in general purpose RapidWeaver plugin.
