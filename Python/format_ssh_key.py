#!/usr/bin/env python3
"""
Quick script to format SSH keys for entry to the SSH key yaml doc.

Unfortunately, PyYAML doesn't act as expected, and so can't be used for this;
as a result, this is likely dirty, hacky code.
Everyone's favourite.
"""

"""
TODO:
  - Allow parsing of `ssh-add -L` or public key files
  - Specify the user to add for, instead of using the "dummy user name"
  - Update the vars file directly
  - Handle piping and the like, so can pipe a key in on stdin.
"""


max_line_length = 80
wrap_length = 72

def block_or_quote(value):
    """Determine whether block or quotation syntax should be used"""
    max_line_after_indent = max_line_length - len("    key: ")
    if len(value)  < max_line_after_indent:
        return value
    else:
        # See whether the length of each part is sufficient to allow for simple
        # block scalar formatting.
        result = ">-"
        for part in value.split(" "):
            # Extra two spaces because an extra level of indent
            if len("  " + part) <= max_line_after_indent:
                result += "\n      {}".format(part)
            else:
                result = None
                break
        if result is not None:
            return result

        # Otherwise, it's too long for block syntax and needs to be wrapped
        # Add the quotes to the key
        value = value + '"'
        result = '"'
        indent_level = 10
        first = True
        while len(value) > 0:
            next_section = value[:wrap_length - indent_level - 1 ] + '\\'
            value = value[wrap_length - indent_level - 1:]

            if not first:
                next_section = "\n" + indent_level*' ' + next_section
            else:
                first = False
            result = result + next_section
        # Trim the now-superfluous trailing backslash
        return result[:-1]


def main():
    """Main block, called when the script is invoked from the command line"""
    key = input("Enter the SSH key to format: ")
    comment = input("Enter a descriptive comment for this key: ")

    formatted = block_or_quote(key)

    print("---")
    print("dummy_user_name:")
    print("  - comment: {}".format(comment))
    print("    key: {}".format(formatted))

if __name__ == "__main__":
    main()
