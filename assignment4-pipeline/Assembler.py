#!/usr/bin/env python
__author__ = 'David Lavoie-Boutin'

import re
import json


def encrypt(string, length):
    return ' '.join(string[i:i+length] for i in xrange(0,len(string),length))


class Assembler(object):

    full_line_comment = re.compile(ur'^\s*#.*')
    inline_comment_regex = re.compile(ur'#.+$')
    label_regex = re.compile(ur'^.*?(?=:)')
    argument_regex = re.compile(ur'([\w|$]+)')
    between_parentheses = re.compile(ur'(?<=\().+(?=\))')
    before_parentheses = re.compile(ur'(?<=\s).+(?=\()')

    def __init__(self, input_file, mips_isa_file):
        self.file_in = open(input_file, 'r')
        self.file_temp = open(input_file + ".json", 'w')
        self.file_out = open(input_file + ".bin", 'w')
        self.mips_isa_file = open(mips_isa_file, 'r')
        self.misp_isa = json.load(self.mips_isa_file)

        self.line_number = 0
        self.labels = {}

        self.queue = []

    def run(self):
        self.process_file()
        json.dump({"instructions":self.queue, "labels":self.labels}, self.file_temp, indent=4, separators=(',', ': '))
        for ins in self.queue:
            self.build_machine_code(ins)

    def parse_argument(self, index, inst_list):
        try:
            current = inst_list[index]
        except IndexError:
            return 0

        try:
            return self.labels[inst_list[index]]
        except KeyError:
            pass

        if '$' in current:
            return int(inst_list[index].strip("$"))
        elif "0x" in current:
            return int(inst_list[index], 16)
        else:
            return int(inst_list[index])


    def build_machine_code(self, instruction):
        try:
            prop = self.misp_isa[instruction[0]]
        except KeyError:
            print("Invalid instruction identifier")
            print(instruction)
            exit(1)
            return
        except IndexError:
            return

        if prop["type"] == "r":
            rd = "{:05b}".format(0)
            rs = "{:05b}".format(0)
            rt = "{:05b}".format(0)
            sa = "{:05b}".format(0)

            if instruction[0] in ["sll", "srl", "sra"]:
                """
                    format : sll $rd, $rt, $sa
                """

                rt = "{:05b}".format(self.parse_argument(2,instruction))
                rd = "{:05b}".format(self.parse_argument(1,instruction))
                sa = "{:05b}".format(self.parse_argument(3,instruction))

            elif instruction[0] in ["div", "divu", "mult", "multu"]:
                """
                    format : div $rs, $rt
                """
                rs = "{:05b}".format(self.parse_argument(1,instruction))
                rt = "{:05b}".format(self.parse_argument(2,instruction))

            elif instruction[0] in ["mfhi", "mflo"]:
                """
                    format : mflo $rd
                """
                rd = "{:05b}".format(self.parse_argument(1,instruction))

            elif instruction[0] in ["jr"]:
                """
                    format : rj $rs
                """
                rs = "{:05b}".format(self.parse_argument(1,instruction))

            else:
                """
                    format : sll $rd, $rs, $rt
                """
                rs = "{:05b}".format(self.parse_argument(2,instruction))
                rt = "{:05b}".format(self.parse_argument(3,instruction))
                rd = "{:05b}".format(self.parse_argument(1,instruction))

            line = prop["opcode"] + rs + rt + rd + sa + prop["funct"]

        elif prop["type"] == "i":
            rt = "{:05b}".format(self.parse_argument(1,instruction))
            if instruction[0] in ["ll", "lw", "sh", "sc", "sb", "lbu", "lhu", "sw"]:
                rs = "{:05b}".format(self.parse_argument(len(instruction) - 1,instruction))
                if len(instruction) == 3:
                    immediate = "{:016b}".format(0)
                else:
                    immediate = "{:016b}".format(self.parse_argument(2,instruction))
            elif instruction[0] in ["lui"]:
                rs = "{:05b}".format(0)
                immediate = "{:016b}".format(self.parse_argument(2,instruction))

            else:
                rs = "{:05b}".format(self.parse_argument(2,instruction))
                immediate = "{:016b}".format(self.parse_argument(3,instruction))


            line = prop["opcode"] + rs + rt + immediate

        elif prop["type"] == "j":
            address = "{:026b}".format(self.parse_argument(1,instruction))


            line = prop["opcode"] + address

        else:
            line = "{:032b}".format(0)

        print encrypt(line, 4), '\t', instruction
        self.file_out.write(line + '\n')

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
            Prior to entering this function, full comments line should have been removed
            Only instruction lines should be processed
        """
        comments = re.search(self.inline_comment_regex, line)
        if comments:
            line = line.replace(comments.group(), "")

        label = re.search(self.label_regex, line)
        if label:
            line = line.replace(label.group(), "")

            if not self.labels.has_key(label.group()):
                self.labels[label.group()] = self.line_number
            else:
                raise KeyError("Label already exists in program")

        args = re.findall(self.argument_regex, line)
        self.queue.append(args)
        self.line_number += 1

    def __del__(self):
        self.file_in.close()
        self.file_temp.close()
        self.mips_isa_file.close()
        pass

if __name__ == '__main__':
    assembler = Assembler("./test.asm", "./mips-isa.json")
    assembler.process_line("lw $3, 5($5)")
    assembler.run()