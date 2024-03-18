import random
from faker import Faker
import datetime
import csv


def booking_details():
    data = dict()
    fake = Faker()
    data["firstname"] = fake.first_name()
    data["lastname"] = fake.last_name()
    data["totalprice"] = random.randint(100,999)
    data["depositpaid"] = random.choices([True,False],[100,1])
    date1 = fake.date_this_year(before_today=False, after_today=True)
    date2 = date1 + datetime.timedelta(days=random.randint(2,30))
    data["bookingdates"] = {"checkin":str(date1),
                                "checkout":str(date2)}
    data["additionalneeds"] = random.choice(["Breakfast","Lunch","Dinner"])
    return data

def get_invalid_booking_details():
    with open('./resources/invalid_booking_details.csv',mode='r') as file:
        csv_reader = csv.reader(file)
        b = []
        for row in csv_reader:
            b.append(row)
        a = b[0]
        all_data=[]
        for j in range(len(b[1:])):
            data = dict()
            data["bookingdates"]={}
            for i in range(len(a)):
                if b[i+1][j]=="":
                    continue
                else:
                    if a[i] == "totalprice":
                        data[a[i]] = int(b[j+1][i])
                    elif a[i] in ["checkindate","checkoutdate"]:
                        data["bookingdates"][a[i][:-4]] = b[j+1][i]
                    elif a[i] == "depositpaid":
                        data[a[i]] = bool(b[j+1][i])
                    else:
                        data[a[i]] = b[j+1][i]
            all_data.append(data)


    return all_data