# COMOTO CLI

We recommend setting up an alias `alias m=comoto_cli`

TODO: can `cd` be accomplished in an executable? ... using exec that is...
TODO: add to a setup script "recommended: install modheader for chrome"
TODO: part of setup should also be the recommendation to open that elasticsearch browser window. FOr me, I reached about 4.5 million records in 8 or 9 hours.
  That's half a mil each hour
TODO: make a note that bouncing the containers during the elasticsearch step will kill that step. Beware
TODO: add something about the elixir formatter?

## Contributing

Checklist for adding new option or arg to a command:

- [ ] Did you update the completion script?
- [ ] Did you add it to the help message?
- [ ] Should the Summary be changed?
- [ ] Or the Usage message?

## Justification

- help
- autocomplete
- encapsulate difficult-to-remember solutions problems like when an iex session can't connect b/c the erlang node is already in use
- kubernetes setup (took me a couple hours, typing in indv command and copy/pasting). Now it's done in a few keystrokes
    -
- Note how the command is previewed (e.g. m kube -b)
