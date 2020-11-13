r"""__  __                               _             __          __
   / /_/ /_  ___  ____ _____ _____ ___  (_)___  ____ _/ /_  ____  / /_
  / __/ __ \/ _ \/ __ `/ __ `/ __ `__ \/ / __ \/ __ `/ __ \/ __ \/ __/
 / /_/ / / /  __/ /_/ / /_/ / / / / / / / / / / /_/ / /_/ / /_/ / /_
 \__/_/ /_/\___/\__, /\__,_/_/ /_/ /_/_/_/ /_/\__, /_.___/\____/\__/
               /____/                        /____/
"""
# Import the required libraries
import sys

from PyQt5.QtGui import *
from PyQt5.QtWidgets import *

# Output paths
output = []


# A function to get the files
def getFiles():
    # Open the file dialog box
    dlg = QFileDialog()
    # Select verilog files
    dlg.setNameFilter("Verilog (*.v)")
    # If any file is selected in the dialog box
    if dlg.exec_():
        # Get the list of files selected
        filenames = dlg.selectedFiles()
        # Transfer the selected file
        compute(filenames[0])
        with open(filenames[0], "r") as fp:
            data = fp.read()
            ex.contents1.setText(data)


# A function that print all paths between thw source and destination
def printAllPaths(graph1, source, destination, visited1, path1):
    visited1[source] = True
    # Append the source to the path
    path1.append(source)
    # If the source and destination is reached, the path is complete
    if source == destination:
        # Append the path to the output
        output.append(str(path1))
    # If the source is different to the destination
    else:
        # Loop through the list of next nodes
        for _ in graph1[source]:
            # If the node in not visited
            if not visited1[_]:
                # Update the source with the same destination
                printAllPaths(graph1, _, destination, visited1, path1)
    # If the source does not match the destination or all its children are visited, pop the latest node
    path1.pop()
    # Set visited to false
    visited1[source] = False


# A function to format the .v file
def formatFile(filePath):
    # Read the contents of the file
    with open(filePath, "r") as fp:
        fileData = fp.read()
    # Add a new line after each semi-colon
    fileData = fileData.replace(";", ";\n")
    # Write the modified contents to the file
    with open(filePath, "w") as fp:
        fp.write(fileData)


# A function to compute the paths
def compute(filePath):
    # Instantiate the graph dictionary
    graph = {}
    # There can be three types of data => input, output, wire
    # Reg cannot have continuous assignment, so it is excluded
    data_types = ['input', 'output', 'wire']
    input_gates = ['and', 'nand', 'or', 'nor', 'xor', 'xnor', 'not']
    # Instantiate the gates dictionary
    not_gates = {}
    other_gates = {}
    # Instantiate a dictionary for different types of data
    iow_data = {
        'input': [],
        'output': [],
        'wire': []
    }

    # Format the given .v file
    # formatFile(filePath)

    # Open the .v file taken from the user
    with open(filePath, "r") as fp:
        # Read the file line by line
        fileData = fp.readlines()

    # Loop through each line
    for it in fileData:
        # Separate the variables from the symbols
        it = it.replace(',', ' , ')
        it = it.replace(';', ' ; ')
        it = it.replace('(', ' ( ')
        it = it.replace(')', ' ) ')
        # Split each line into words
        name = it.split()
        # If the line is empty
        if len(name) == 0:
            # Goto the next line
            continue
        # If the line has the keywords 'module' and 'endmodule'
        if name[0] == 'module' or name[0] == 'endmodule':
            # Goto the next line
            continue
        # If the line starts with a data type
        elif name[0] in data_types:
            # Loop through the words of that line
            for a in name:
                # Ignore the data type and the symbols => ',' and ';'
                if a != ',' and a != ';' and a != name[0]:
                    # Append the variables to the data
                    iow_data[name[0]].append(a)
        # Else
        else:
            # Get the gate name
            gate = name[0]
            # Get the instantiation name of the gate
            gate_name = name[1]
            # If the gate is a not gate
            if gate == 'not':
                # Add the gate instantiation name to the dictionary
                not_gates[gate_name] = []
            # Else
            else:
                # Add the gate instantiation name to the dictionary
                other_gates[gate_name] = []
            # Ignore the first two words
            name = name[2:]
            # If the word is a gate
            if gate in input_gates:
                # Loop through the words of that line
                for a in name:
                    # Ignore the symbols => '(', ')', ',', ';'
                    if a != '(' and a != ')' and a != ',' and a != ';':
                        # If the gate is not
                        if gate == 'not':
                            # Add to the not gate dictionary
                            not_gates[gate_name].append(a)
                        # Else
                        else:
                            # Add to the gates dictionary
                            other_gates[gate_name].append(a)
    # Add the inputs to the graph as nodes
    for a in iow_data['input']:
        graph[a] = []
    # Add the gates to the graph as nodes
    for a in other_gates.keys():
        graph[a] = []
    # Add the not gates to the graph as nodes
    for a in not_gates.keys():
        graph[a] = []
    # Add the outputs to the graph as nodes
    for a in iow_data['output']:
        graph[a] = []
    # Loop through not gates
    for a, b in not_gates.items():
        # not not_0 (out, in)
        # If 'in' is an input
        if b[1] in iow_data['input']:
            # Append the gate to the input
            graph[b[1]].append(a)
        # If 'in' is a wire
        else:
            # Loop through the not gates
            for x, y in not_gates.items():
                # If the output of the other gate is the input of the present gate
                if y[0] == b[1]:
                    # Append the gate to the present gate
                    graph[x].append(a)
            # Loop through the other gates
            for x, y in other_gates.items():
                # If the output of the other gate is the input of the present gate
                if y[0] == b[1]:
                    # Append the gate to the present gate
                    graph[x].append(a)
        # If 'out' is an output
        if b[0] in iow_data['output']:
            # Append the output to the present gate
            graph[a].append(b[0])
    # Loop through the other gates
    for a, b in other_gates.items():
        # gate gate_0 (out, in1, in2)
        # If 'in1' is an input
        if b[1] in iow_data['input']:
            # Append the gate to the input
            graph[b[1]].append(a)
        # If 'in2' is an input
        if b[2] in iow_data['input']:
            # Append the gate to the input
            graph[b[2]].append(a)
        # If 'in1' is a wire
        if b[1] in iow_data['wire']:
            # Loop through the not gates
            for x, y in not_gates.items():
                # If the output of the other gate is the input of the present gate
                if y[0] == b[1]:
                    # Append the gate to the present gate
                    graph[x].append(a)
            # Loop through the other gates
            for x, y in other_gates.items():
                # If the output of the other gate is the input of the present gate
                if y[0] == b[1]:
                    # Append the gate to the present gate
                    graph[x].append(a)
        # If 'in1' is a wire
        if b[2] in iow_data['wire']:
            # Loop through the not gates
            for x, y in not_gates.items():
                # If the output of the other gate is the input of the present gate
                if y[0] == b[2]:
                    # Append the gate to the present gate
                    graph[x].append(a)
            # Loop through the other gates
            for x, y in other_gates.items():
                # If the output of the other gate is the input of the present gate
                if y[0] == b[2]:
                    # Append the gate to the present gate
                    graph[x].append(a)
        # If 'out' is an output
        if b[0] in iow_data['output']:
            # Append the output to the present gate
            graph[a].append(b[0])
    # Create a dictionary of the nodes for finding the paths
    temp = list(other_gates.keys()) + iow_data['input'] + iow_data['output'] + list(not_gates.keys())
    visited = {}
    # Initialize visited of all nodes to false
    for a in temp:
        visited[a] = False
    # Initialize an empty path
    path = []
    # For each combination of input and output
    for a in iow_data['input']:
        for b in iow_data['output']:
            # Find all paths between them
            printAllPaths(graph, a, b, visited, path)
    # Concat the outputs to one string
    y = ""
    for x in output:
        x = x.replace("'", "")
        x = x.replace(", ", " -> ")
        x = x.replace("[", "[ ")
        x = x.replace("]", " ]")
        y = y + x + "\n"
    # Set the output to the text editor
    ex.contents2.setText(y)


# A class for the file dialog box
class fileDialog(QWidget):
    # Init function for the class
    def __init__(self, parent=None, *argv, **kwargs):
        super(fileDialog, self).__init__(parent, *argv, **kwargs)
        # Get a vertical layout
        layout = QVBoxLayout()
        # Get a push button
        self.btn1 = QPushButton("Select a Verilog file")
        # Set the on-click function
        self.btn1.clicked.connect(getFiles)
        # Add the widget to the layout
        layout.addWidget(self.btn1)

        # Get a horizontal layout
        hLayout1 = QHBoxLayout()
        # Get a label
        self.label1 = QLabel("Verilog File")
        # Add the widget to the layout
        hLayout1.addWidget(self.label1)
        # Get a label
        self.label2 = QLabel("Output Paths")
        # Add the widget to the layout
        hLayout1.addWidget(self.label2)
        # Nest the horizontal layout in the vertical layout
        layout.addLayout(hLayout1)

        # Get a horizontal layout
        hLayout = QHBoxLayout()
        # Get a text edit box
        self.contents1 = QTextEdit()
        # Make the text edit box read only
        self.contents1.setReadOnly(True)
        # Add the widget to the layout
        hLayout.addWidget(self.contents1)
        # Get a text edit box
        self.contents2 = QTextEdit()
        # Make the text edit box read only
        self.contents2.setReadOnly(True)
        # Add the widget to the layout
        hLayout.addWidget(self.contents2)
        # Nest the horizontal layout in the vertical layout
        layout.addLayout(hLayout)
        # Set the vertical layout
        self.setLayout(layout)
        # Set the window title
        self.setWindowTitle("Input-Output Path")


# A function to implement dark mode to the application
def setDarkMode():
    # Force the style to be the same on all OSs
    app.setStyle("Fusion")
    # A palette to switch to dark colors
    palette = QPalette()
    palette.setColor(QPalette.Window, QColor(53, 53, 53))
    palette.setColor(QPalette.WindowText, QColor(255, 255, 255))
    palette.setColor(QPalette.Base, QColor(25, 25, 25))
    palette.setColor(QPalette.AlternateBase, QColor(53, 53, 53))
    palette.setColor(QPalette.ToolTipBase, QColor(0, 0, 0))
    palette.setColor(QPalette.ToolTipText, QColor(255, 255, 255))
    palette.setColor(QPalette.Text, QColor(255, 255, 255))
    palette.setColor(QPalette.Button, QColor(53, 53, 53))
    palette.setColor(QPalette.ButtonText, QColor(255, 255, 255))
    palette.setColor(QPalette.BrightText, QColor(255, 0, 0))
    palette.setColor(QPalette.Link, QColor(42, 130, 218))
    palette.setColor(QPalette.Highlight, QColor(42, 130, 218))
    palette.setColor(QPalette.HighlightedText, QColor(0, 0, 0))
    # Set the modified palette
    app.setPalette(palette)


# Main driver function for the program
if __name__ == '__main__':
    # Start a Qt application
    app = QApplication(sys.argv)
    setDarkMode()
    # Initialize the file dialog class
    ex = fileDialog()
    # Show the file dialog window
    ex.show()
    # Exit the application, on click of close
    sys.exit(app.exec_())
