# CLI


## A Command Line publisher for RapidWeaver.



### Description

CLI is a plugin for RapidWeaver that adds a very basic publsihing a file from the command line.  The goal is to produce a repeatable mechanism for automating publishing for integration testing.

### Use
 - set up a project file (one is provided in this project as an example)
 - make sure to specify the publish location
 - on the command line:

```

% /Applications/RapidWeaver\ 7.app <file to publish> --publish all

```

### Use in a script
You can automate publishing in a script.  An example script is provided.


### Warning

This plugin uses several private mechanism in order run the publish. You should not use fragile private methods like these in general purpose RapidWeaver plugin.
