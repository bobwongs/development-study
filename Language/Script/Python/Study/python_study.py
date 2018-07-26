#!/usr/bin/python
# -*- coding: utf-8 -*-

' Script Biref Description '

__author__ = 'BobWong'

def getNames(string):
    name = ''
    startTag = "class='"
    endTag = "'"
    if string.find(startTag) < 0:
        startTag = 'class="'
        endTag = '"'
        if string.find(startTag) < 0:
            return []

    startIndex = string.find(startTag)+len(startTag)
    subString = string[startIndex : len(string)]
    endIndex = startIndex + subString.find(endTag)
    name = string[startIndex : endIndex]
    array = getNames(string[endIndex:])
    array.insert(0, name)
    return array

def main():
    string = "<view class='myClassName'></view><view class='myNewClassName'></view>"
    array = getNames(string)
    print array

if __name__=='__main__':
    main()
