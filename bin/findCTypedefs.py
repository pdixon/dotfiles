""" This script is intend to find the user defined types in
    C code. """
import sys
import re
from optparse import OptionParser

def processFile(inFile,typeList):
    pattern = re.compile(r'(?:.*?)typedef(?:.*?)\b(\w+);(?:.*?)')
    multilinePattern = re.compile(r'(?:.*?)typedef(?:.*?)\{(?:.*?)')
    multilinePattern2 = re.compile(r'(?:[^\}]*?)\}(?:.*?)(\w+);(?:.*?)')
    for line in inFile:
        result = pattern.search(line)
        if result != None:
            typeList.append(result.group(1))
        elif multilinePattern.search(line) != None:
            try:
                result = multilinePattern2.search(line)
                while result == None:
                    line = inFile.next()
                    result = multilinePattern2.search(line)
                typeList.append(result.group(1))
            except StopIteration:
                print 'unterminated multiline.'
                break

def main(argv):
    usage = "usage: %prog FILES"
    version="%prog v0.1"
    parser = OptionParser(usage=usage,version=version)
    [options,args]=parser.parse_args()

    if len(args) == 0:
        parser.error("No input file.")

    typeList = []

    for inFile in args:
        try:
            fsock = open(inFile)
            types = processFile(fsock,typeList)
            fsock.close()
        
        except IOError:
            print "Error reading file" + inFile

    s = ''
    
    for type in typeList:
        s = s + ' -T %s'%type

    print s
        
if __name__ == "__main__":
    main(sys.argv)
