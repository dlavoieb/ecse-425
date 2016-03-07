#!/usr/bin/env python
__author__ = 'David Lavoie-Boutin'

import re
import Queue


class Assembler(object):

    full_line_comment = re.compile(ur'^\s*#.*')
    inline_comment_regex = re.compile(ur'#.+$')
    label_regex = re.compile(ur'^.*?(?=:)')
    argument_regex = re.compile(ur'([\w|$]+)')

    def __init__(self, input_file, output_file):
        self.file_in = open(input_file, 'r')
        # self.file_out = open(output_file, 'w')

        self.line_number = 0
        self.labels = {}

        self.queue = Queue.Queue()
        self.process_file()

        for elem in self.queue.queue:
            print(elem)
        print self.labels

    def process_file(self):
        for line in self.file_in:
            line = line.strip('\n')
            # find full comments lines
            comment = re.search(self.full_line_comment, line)
            if comment:
                line = line.replace(comment.group(), "")

            if line.strip(" "):
                self.process_line(line)



    def process_line(self, line):
        """
            Prior to entering this function full comments line should have been removed
            Only instruction lines should be processed
        """
        #remove comments
        comments = re.search(self.inline_comment_regex, line)
        line = line.replace(comments.group(), "")

        label = re.search(self.label_regex, line)
        if label:
            line = line.replace(label.group(), "")

            if not self.labels.has_key(label.group()):
                self.labels[label.group()] = self.line_number
            else:
                raise KeyError("Label already exists in program")

        args = re.findall(self.argument_regex, line)
        self.queue.put(args)
        self.line_number += 1

    def __del__(self):
        self.file_in.close()
        # self.file_out.close()
        pass

if __name__ == '__main__':
    assembler = Assembler("./test.asm", "b")
