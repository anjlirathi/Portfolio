ice_cream = [ 'Vanilla', 'BlackBerry', 'PanCake']
print(ice_cream)

type (ice_cream)

ice_cream.append('Stawberry')
print(ice_cream)

ice_cream[3] = 'Strawberry'
print(ice_cream)

nested_list = ['Blueberry', 15, ['Vanilla', ['Caramel','BlackBerry'],0], True, 'PanCake', 'Stawberry']
print(nested_list)
nested_list[3]
type()

type(nested_list[3])

nested_list[2][0]

nested_list[2][2]

a = ()
type(a)

t = (1, [3,4], True)
print(t)

type (t)

s = {1,32, 4, 6, 37, 98, 54}
print(s)

type(s)

s1 ={2,4, 5.8, False, 'bricks'}
print(s1)

print(s-s1)

print(s1-s)

print(s^s1)

dict1 = {'Name' : 'Anjali', 'heights' : [2,5.1, 6.4], 'Age': 30 , 'bool': True}
print(dict1)

if 25>10:
    print('It worked...')

if 25 < 10:
    print('it worked')
elif 25 <30:
    print('elif worked')
elif 25 <35:
    print('elif 2 worked')
else:
    print("it didn't worked")
if 25 < 10:
    print('it worked')
elif 25 <30:
    print('elif worked')
elif 25 <35:
    print('elif 2 worked')
else:
    print("it didn't worked")
    
intergers = [1,2,3,4,5]
for num in intergers:
    print(num)
for num in intergers:
    print('yessss!!!')

for jelly in intergers:
    print(jelly+jelly)

ice_cream_dict = {'name': 'Anjali', 'Weekly intake': 5, 'fav ice cream': ['vanilla', 'MCC']}
for cream in ice_cream_dict.values():
    print(cream)

for key, values in ice_cream_dict.items():
    print(key, '=', values)

flavours = ['Vanilla', 'Black Current', 'Cranberry']
toppings = [ 'Hot fudge', 'Oreos', 'Chocolate Chips']
for one in flavours:
    for two in toppings:
        print( one, 'topped with' , two)

number = 0
while number < 5:
    print(number)
    number = number+1

num = 0 
while num <5:
    print(num)
    if num == 3:
        break
    num = num +1

num = 0 
while num <5:
    print(num)
    if num == 3:
        break
    num = num +1

num = 0 
while num <5:
    print(num)
    if num == 6:
        break
    num = num +1
else:
    print('no longer <5')

##num = 0 
##while num <5:
    print(num)
    if num == 3:
#    continue
     num= num +1
#else:
    print('no longer <5') ## infinite loop
  
num = 0
while num <5:
    num = num +1
    if num == 3:
        continue
    print(num)   
else:
    print('no longer <5')    ## to avoid infinite loop

def first_func():
    print('it worked')
first_func()

def number_Square(number):
    print(number**2)
number_Square(4)

def number_Square_cust(number, power):
    print(number**power)
number_Square_cust(5,3)

def number_args(*number):
    print(number[2]*number[3])

number_args(6,7,5,2)

args_tup = (6,7,5,2)

def number_args(*number):
    print(number[2]*number[1])
number_args(*args_tup)

def number_Square_cust(number, power):
    print(number**power)
number_Square_cust(power =3, number =3)

def number_kwargs(**number):
    print( 'My number is '  + number['int1']  +  ' and my another number is '  + number['int2'])
number_kwargs(int1 = '478956', int2 = '223658')

num_int = 5
type(num_int)

num_str = '4'
type(num_str)

num_str_covd = int(num_str)
type(num_str_covd)

num_sum = num_str_covd + num_int
print(num_sum)
type (num_sum)

list_type = [1,2,3,5,1.2]
type(list_type)

type(tuple(list_type))

tuple(list_type)

list_type1 = [1,1,2,2,5,1,5,6,2,3,5,3]
set(list_type1)
type(set(list_type1))

dict_type = {'Name' : 'Anjali', 'Age': 29, 'Job': 'Data Analyst'}
type(dict_type)

dict_items = ([('Name', 'Anjali'), ('Age', 29), ('Job', 'Data Analyst')])

dict_type.values()
type(dict_type.values())

list(dict_type.values())
type(list(dict_type.values()))

dict_type.keys()
type(list(dict_type.keys()))

long_str = 'I love to mediate'
list(long_str)

set(long_str)
