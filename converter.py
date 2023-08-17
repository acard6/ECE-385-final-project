import math

class text( object ):
    def __init__(self, string=""):
        self.text = string.upper()

    def __repr__(self):
        numb = self.conv()
        rep = ("cell: " + self.text + "\nnumber: " + str(numb))
        return rep

    def __str__(self):
        numb = self.conv()
        string = (self.text + " " + str(numb))
        return string

    def conv(self):
        letter = list(self.text)
        letter.reverse()
        numb = 0
        for i in range(len(letter)):
            numb += (ord(letter[i])%64) * pow(26,i)
        return numb

    def new(self, newText):
        self.text = newText.upper()
##########################################
class numb( object ):
    def __init__(self, number=1):
        self.numb = number

    def __repr__(self):
        text = self.conv()
        rep = ("number: " + str(self.numb) + "\ncell: " + text)
        return rep

    def __str__(self):
        text = self.conv()
        string = (str(self.numb) + " " + text)
        return string

    def new(self, newNumb):
        self.numb = newNumb

    def conv(self):
        number = self.numb
        letter = []
        second = 0
        third = 0
        base = number%26
        while(number > 1):
            number = number//26
            if(0 < number-1 <= 25):
                second = number
            if (second > 26):
                number = number // 26
                third = number

        if (third != 0): letter.append(chr(64+third))
        if (second != 0): letter.append(chr(64+second))
        letter.append(chr(64+base))

        new = ""
        for i in range(len(letter)):
            new += letter[i]
        return new


def main():
    a = numb(480)
    print(a)

if __name__ == "__main__":
    main()  