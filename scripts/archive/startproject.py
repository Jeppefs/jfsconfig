import os
import subprocess

def newkitty():
    subprocess.run(["i3-msg", "exec", "kitty"])

def rollespil():
    subprocess.run(["i3-msg", "exec", "code"])

projects = "newkitty\nrollespil\n" 

p1 = subprocess.Popen(["echo", projects], stdout=subprocess.PIPE )
p2 = subprocess.Popen(["rofi", "-dmenu"], stdin=p1.stdout, stdout=subprocess.PIPE)

text, err = p2.communicate()
text = str(text)[2:-3] # Remove artifact of stdout

print(text)
eval(text)()

# text = input("please enter something: ")
# print(text)