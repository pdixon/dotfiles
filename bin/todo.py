#! /usr/bin/python

from pyparsing import Suppress, Word, White, printables, OneOrMore, SkipTo, ZeroOrMore

LPAREN, RPAREN = map(Suppress, "()")
word = Word(printables)
comment = word + OneOrMore(word|White())
comment.setParseAction(lambda s: s)
#todo = SkipTo(LPAREN + Suppress("TODO") + comment + RPAREN)
todo = OneOrMore(SkipTo(Suppress("TODO"), include=True)+comment)
def scan_file(in_file):
    r = todo.parseFile(in_file)
    print r

if __name__ == "__main__":
    import sys

    for in_file in sys.argv[1:]:
        scan_file(in_file)
