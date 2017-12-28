# from lxml.html import fromstring
import lxml.html
import requests
import csv

def enquote(string):
    return "\"" + string.replace(r'"', r'""') + "\""
myname = "Jimmy Qi"

csvFileName = "smokers" + ".csv"
csv = open(csvFileName, 'w')
colNames = "Names, Day of Week, Date, Time, Message"
csv.write(colNames + "\n")


htmlFile = open("D:/Projects/R projects/Facebook/data/messages/smokers.html", 'r', errors="ignore")

source = htmlFile.read()

htmlElem = lxml.html.fromstring(source)

for elem in htmlElem.getiterator():
    text = elem.text_content()
    if elem.tag == "title":
        name = text + ", " + myname

        nameList = text.split()[2:]

        print(name)
    elif elem.tag == "span":

        date = text.split()
        if len(date) == 7:

            dayofweek = date[0]
            mmddyy = date[1] + " " + date[2] + " " + date[3]
            time = date[5] + " " + date[6]
            print("Time: " + dayofweek + "\"" + mmddyy + "\"," + time + ",")
            csv.write(enquote(dayofweek.replace(",", "")) + "," + enquote(mmddyy) + "," + enquote(time) + ",")

        elif text in name:
            print("Name: " + text)
            csv.write(enquote(text) + ",")

        else:
            continue

    elif elem.tag == "p":

        print("Message: " + text)
        csv.write(enquote(text) + "\n")







