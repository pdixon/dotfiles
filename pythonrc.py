try:
    import readline
except ImportError:
    print "No Readline"
    pass
else:
    import rlcompleter
    import os.path
    import atexit

    class irlcompleter(rlcompleter.Completer):
        def complete(self, text, state):
            if text == "":
                readline.insert_text('\t')
                return None
            else:
                return rlcompleter.Completer.complete(self,text,state)

    readline.parse_and_bind("tab: complete")
    readline.set_completer(irlcompleter().complete)

    # Restore our command-line history, and save it when Python exits.
    history_file = os.path.expanduser("~/.pyhistory")
    if os.path.exists(history_file):
        readline.read_history_file(history_file)
        def save_hist():
            import readline
            readline.write_history_file(history_file)
        atexit.register(save_hist)
